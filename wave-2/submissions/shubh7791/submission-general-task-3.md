# Story Validator Grafana Dashboard By Vitwit

- [Grafana Dashboard JSON file](https://raw.githubusercontent.com/shubh7791/story-node-monitoring/refs/heads/main/story-grafana-dashboard.json)

## Installation Guide

### 1. Install Node Exporter

#### Download Node Exporter:

```bash
cd /opt
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz
tar -xvf node_exporter-1.8.2.linux-amd64.tar.gz
mv node_exporter-1.8.2.linux-amd64 node_exporter
```

#### Create a Node Exporter systemd service:
Create a file at /etc/systemd/system/node_exporter.service with the following content:
```
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=root
ExecStart=/opt/node_exporter/node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
```

#### Start and enable Node Exporter:
```
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
```
### 2. Download Prometheus:
```
cd /opt
wget https://github.com/prometheus/prometheus/releases/download/v2.54.1/prometheus-2.54.1.linux-amd64.tar.gz
tar -xvf prometheus-2.54.1.linux-amd64.tar.gz
mv prometheus-2.54.1.linux-amd64 prometheus
```
#### Add the following contents in the prometheus.yml file:
```
- job_name: 'node_exporter'
  static_configs:
    - targets: ['localhost:9100']
```
#### Create a Prometheus systemd service:
Create a file at /etc/systemd/system/prometheus.service with the following content:
```
[Unit]
Description=Prometheus
After=network.target

[Service]
User=root
ExecStart=/opt/prometheus/prometheus --config.file=/opt/prometheus/prometheus.yml --web.listen-address=":9090"
Restart=always

[Install]
WantedBy=multi-user.target
```
#### Start and enable Prometheus:
```
systemctl daemon-reload
systemctl start prometheus
systemctl enable prometheus
```
### 3. Install Grafana
Add Grafana repository and install:
For Ubuntu:
```
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/release/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install grafana
```
### 4. Access Grafana
Grafana will be accessible at http://your_server_ip:3000. The default login credentials are:

- Username: admin
- Password: admin

You will be prompted to change the password on the first login.

### 5. Import the JSON Dashboard
1. Open Grafana and log in.
2. Click on the "+" icon in the left sidebar, then select "Import."
3. Upload your story-node-monitoring.json file or paste the JSON content directly.
4. Choose the Prometheus data source you configured earlier.
5. Click "Import" to add the dashboard.
