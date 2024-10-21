# Prometheus and Grafana Setup

This document provides step-by-step instructions to set up **Prometheus and Grafana** for monitoring, using **Empirex's Story Grafana Dashboard**. This dashboard offers a comprehensive view of your node's **health and performance**, making it easy to track **metrics**, **troubleshoot issues**, and **optimize** your setup.

You can access the **Empirex Story Grafana Dashboard** here:  
[**Empirex Story Dashboard**](http://story-dashboard.empirex.tech/d/Empirex/story-grafana-by-empirex?orgId=1).

## Login Credentials
- **Username:** admin  
- **Password:** 1246  

Follow the guide below to set up your own **monitoring system** using **Prometheus and Grafana**.

# Installation Guide for Monitoring Setup

Make sure you have the following before starting:

- A Debian-based Linux system
- Root privileges

## Step 1: Install Required Tools

You can install the required tools using one of the following methods:

1. **Single Command**: Run the following command to install all necessary tools in one line:

   ```bash
   cd $HOME && wget -q -O grafana-install.sh https://raw.githubusercontent.com/eempirex/story-chain/refs/heads/main/grafana-install.sh && chmod +x grafana-install.sh && ./grafana-install.sh
   ```

2. **Manual Setup**: Alternatively, execute the following command to install the tools individually:
   ```bash
   sudo apt-get install wget lz4 aria2 pv -y
   ```

## Step 2: Define Text Colors for Logs

Run the following commands to define text colors for log messages:

```bash
green="\e[32m"
red="\e[31m"
yellow="\e[33m"
blue="\e[34m"
purple="\e[35m"
cyan="\e[36m"
reset="\e[0m"
```

## Step 3: Check Root Privileges

To ensure the script is running as root, run:

```bash
if [ "$EUID" -ne 0 ]; then
    echo -e "${red}[✘ ERROR] This script must be run as root. Exiting...${reset}"
    exit 1
fi
echo -e "${green}[✔ SUCCESS] User has root privileges.${reset}"
```

## Step 4: Update System

Update and upgrade your system by running:

```bash
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
```

## Step 5: Install Dependencies

Install necessary dependencies using:

```bash
apt-get install -y curl tar wget original-awk gawk netcat jq figlet
```

## Step 6: Display Banner

To display a banner, ensure `figlet` is installed, then run:

```bash
echo -e '\e[40m\e[92m'
figlet Empirex
echo -e '\e[0m'
```

## Step 7: Get Node Status

Fetch the node status and network configuration:

```bash
port=$(awk '/\[rpc\]/ {f=1} f && /laddr/ {match($0, /127.0.0.1:([0-9]+)/, arr); print arr[1]; f=0}' $HOME/.story/story/config/config.toml)
json_data=$(curl -s http://localhost:$port/status)
story_address=$(echo "$json_data" | jq -r '.result.validator_info.address')
network=$(echo "$json_data" | jq -r '.result.node_info.network')
```

## Step 8: Create Necessary Directories

Create essential directories for Prometheus setup:

```bash
directories=("/var/lib/prometheus" "/etc/prometheus/rules" "/etc/prometheus/rules.d" "/etc/prometheus/files_sd")
for dir in "${directories[@]}"; do
    mkdir -p "$dir"
done
```

## Step 9: Download and Install Prometheus

Download and install Prometheus using:

```bash
cd $HOME
wget https://github.com/prometheus/prometheus/releases/download/v2.45.0/prometheus-2.45.0.linux-amd64.tar.gz
tar xvf prometheus-2.45.0.linux-amd64.tar.gz
mv prometheus-2.45.0.linux-amd64/prometheus promtool /usr/local/bin/
```

## Step 10: Configure Prometheus

Set up the Prometheus configuration by running:

```bash
sudo tee /etc/prometheus/prometheus.yml <<EOF
global:
  scrape_interval: 15s
  evaluation_interval: 15s
alerting:
  alertmanagers:
    - static_configs:
        - targets: []
rule_files: []
scrape_configs:
  - job_name: "prometheus"
    metrics_path: /metrics
    static_configs:
      - targets: ["localhost:9345"]
  - job_name: "story"
    scrape_interval: 5s
    metrics_path: /
    static_configs:
      - targets: ['localhost:26660']
EOF
```

## Step 11: Create Prometheus Systemd Service

Create a systemd service for Prometheus:

```bash
sudo tee /etc/systemd/system/prometheus.service <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target
[Service]
Type=simple
User=root
ExecReload=/bin/kill -HUP \$MAINPID
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus \
  --web.console.templates=/etc/prometheus/consoles \
  --web.console.libraries=/etc/prometheus/console_libraries \
  --web.listen-address=0.0.0.0:9344
Restart=always
[Install]
WantedBy=multi-user.target
EOF
```

## Step 12: Start Prometheus

Reload systemd and start the Prometheus service:

```bash
systemctl daemon-reload
systemctl enable prometheus
systemctl start prometheus
```

## Step 13: Install Grafana

Install Grafana monitoring platform:

```bash
apt-get install -y apt-transport-https software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
echo "deb https://packages.grafana.com/enterprise/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list
apt-get update -y
apt-get install grafana-enterprise -y
systemctl enable grafana-server
systemctl start grafana-server
```

## Step 14: Modify Grafana Dashboard

Download and modify the `grafana-dashboard.json` file:

```bash
prometheus_url="http://localhost:9344"
dashboard_url="https://raw.githubusercontent.com/eempirex/story-chain/refs/heads/main/grafana-dashboard.json"
curl -s "$dashboard_url" -o $HOME/grafana-dashboard.json
sed -i "s/3EFC18878454304004F18E8B3BFF7BC8ED166D10/$story_address/g" $HOME/grafana-dashboard.json
```

## Step 15: Configure Grafana Data Source

Configure the Prometheus data source in Grafana:

```bash
grafana_host="http://localhost:9346"
admin_user="admin"
admin_password="admin"
curl -X POST "$grafana_host/api/datasources" \
    -H "Content-Type: application/json" \
    -u "$admin_user:$admin_password" \
    -d '{
          "name": "Prometheus",
          "type": "prometheus",
          "access": "proxy",
          "url": "'"$prometheus_url"'",
          "basicAuth": false,
          "isDefault": true,
          "jsonData": {}
        }'
```

## Step 16: Import Dashboard into Grafana

Import the modified dashboard into Grafana:

```bash
curl -X POST "$grafana_host/api/dashboards/db" \
    -H "Content-Type: application/json" \
    -u "$admin_user:$admin_password" \
    -d '{
          "dashboard": '"$(cat "$HOME/grafana-dashboard.json")"',
          "overwrite": true,
          "folderId": 0
        }'
```

## Final Step: Access Grafana Dashboard

Find your IP address and access the Grafana dashboard at:

```
http://<your_ip>:9346/d/Empirex/
```

## Conclusion

You have successfully set up Prometheus and Grafana for monitoring. Enjoy your monitoring experience!
