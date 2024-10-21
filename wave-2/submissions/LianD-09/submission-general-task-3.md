# Story Grafana Dashboard
This is the documentation about Story Grafana dashboard and the setup instructions.

## Dashboard
You can view our public dasboard here: https://grafana.artsakh.network/d/be18s0yjyfzlsb/zeus?orgId=1&from=1729297104392&to=1729318704392

Our JSON file: https://gist.github.com/LianD-09/05dd28f331cc7971ea581e3d072cbfcc

## Instruction
The dashboard require prometheus endpoint enabled in your Story config, and 2 additional Prometheus and Grafana client to collect metrics and visualize data. Here are steps to setup the dashboard:

### 1. Enable prometheus in Story
First, you will need to enable prometheus port in Story config:
```bash
nano .story/story/config/config.toml
```

and find for `instrumentation` section and update as follow:
```toml
...
#######################################################
###       Instrumentation Configuration Options     ###
#######################################################
[instrumentation]

# When true, Prometheus metrics are served under /metrics on
# PrometheusListenAddr.
# Check out the documentation for the list of available metrics.
prometheus = true

# Address to listen for Prometheus collector(s) connections
prometheus_listen_addr = ":26660" # you can set to any port you like
...
```

Then restart Story to apply changes:
```bash
sudo systemctl restart story
```

### 2. Install Prometheus and Grafana
here is the script to install Prometheus and Grafana:

```bash
wget https://github.com/prometheus/prometheus/releases/download/v2.54.1/prometheus-2.54.1.linux-amd64.tar.gz
tar -xvf prometheus-2.54.1.linux-amd64.tar.gz 
mv prometheus-2.54.1.linux-amd64/prometheus /root/go/bin
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update && sudo apt-get install grafana
```
### 3. Setup Prometheus
Create `prometheus.yml` configuration file:

```bash
nano $HOME/prometheus.yml
```

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s
scrape_configs:
  - job_name: "story"
    static_configs:
      - targets: ["localhost:26660"] # Story prometheus port
```

Create system service:
```bash
sudo nano /etc/systemd/system/prometheus.service
```

```
[Unit]
Description=Prometheus

[Service]
Type=simple
Restart=always
RestartSec=1
WorkingDirectory=$HOME
ExecStart=/root/go/bin/prometheus

[Install]
WantedBy=multi-user.target
```

Start Prometheus service:
```bash
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl restart prometheus
```

Prometheus service should start collecting data from Story and listen on `9090` port. 
### 4. Grafana setup
First, Yyou need to start Grafana service:
```bash
sudo systemctl restart grafana-server
```

The service will listen on `3000` port, and you can access the dashboard at `http://<your-ip>:3000`. The default username and password are `admin:admin` and you will need to change to your password.

After having access into the dashboard, you will need to create a datasource by going to `Connections` > `Data sources` > `Add new data source`. Then choose Prometheus as the datasource, add Prometheus listen address `http://<your-ip>:9090` and click `Save` to finish.

After the datasource is working, you can go to the `Dashboards` >  `Import dashboard` and create new dashboard by copying our dashboard JSON.

Now you should have the Story Validator dashboard up and running!