# Story Validator Grafana Dashboard Setup Guide

This guide will walk you through the process of setting up a Grafana dashboard to monitor your Story validator node. We'll cover installation of necessary components, configuration of data sources, and creation of a dashboard with essential statistics.

## Prerequisites

- A running Story validator node
- Ubuntu 20.04 or later
- Root or sudo access to the server

## 1. Install Required Components

### 1.1 Install Node Exporter

Node Exporter will collect system-level metrics:

```bash
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
tar xvfz node_exporter-1.3.1.linux-amd64.tar.gz
sudo mv node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/
rm -rf node_exporter-1.3.1.linux-amd64*

sudo useradd -rs /bin/false node_exporter

sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
```

### 1.2 Install Prometheus

Prometheus will scrape and store the metrics:

```bash
wget https://github.com/prometheus/prometheus/releases/download/v2.37.0/prometheus-2.37.0.linux-amd64.tar.gz
tar xvfz prometheus-2.37.0.linux-amd64.tar.gz
sudo mv prometheus-2.37.0.linux-amd64 prometheus
sudo mv prometheus /etc/
rm prometheus-2.37.0.linux-amd64.tar.gz

sudo useradd -rs /bin/false prometheus

sudo tee /etc/prometheus/prometheus.yml > /dev/null <<EOF
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['localhost:9100']
  - job_name: 'story_node'
    static_configs:
      - targets: ['localhost:26660']
EOF

sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOF
[Unit]
Description=Prometheus
After=network.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/etc/prometheus/prometheus --config.file /etc/prometheus/prometheus.yml --storage.tsdb.path /var/lib/prometheus/ --web.console.templates=/etc/prometheus/consoles --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
```

### 1.3 Install Grafana

```bash
sudo apt-get install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install grafana

sudo systemctl start grafana-server
sudo systemctl enable grafana-server
```

## 2. Configure Story Node Exporter

Create a custom exporter for Story-specific metrics:

```bash
sudo tee /usr/local/bin/story_exporter.py > /dev/null <<EOF
#!/usr/bin/env python3
import json
import requests
from prometheus_client import start_http_server, Gauge

# Define metrics
LATEST_BLOCK_HEIGHT = Gauge('story_latest_block_height', 'Latest block height')
PEERS_COUNT = Gauge('story_peers_count', 'Number of peers')
VALIDATOR_VOTING_POWER = Gauge('story_validator_voting_power', 'Validator voting power')

def fetch_metrics():
    try:
        # Fetch latest block height
        response = requests.get('http://localhost:26657/status')
        data = response.json()
        LATEST_BLOCK_HEIGHT.set(int(data['result']['sync_info']['latest_block_height']))
        PEERS_COUNT.set(len(data['result']['peers']))

        # Fetch validator info (replace YOUR_VALIDATOR_ADDRESS with your actual validator address)
        response = requests.get('http://localhost:26657/validators')
        data = response.json()
        for validator in data['result']['validators']:
            if validator['address'] == 'YOUR_VALIDATOR_ADDRESS':
                VALIDATOR_VOTING_POWER.set(int(validator['voting_power']))
                break
    except Exception as e:
        print(f"Error fetching metrics: {e}")

if __name__ == '__main__':
    start_http_server(26660)
    while True:
        fetch_metrics()
        time.sleep(15)
EOF

sudo chmod +x /usr/local/bin/story_exporter.py

sudo tee /etc/systemd/system/story_exporter.service > /dev/null <<EOF
[Unit]
Description=Story Exporter
After=network.target

[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/bin/python3 /usr/local/bin/story_exporter.py

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start story_exporter
sudo systemctl enable story_exporter
```

## 3. Configure Grafana

1. Access Grafana web interface at `http://your_server_ip:3000`
2. Log in with default credentials (admin/admin)
3. Add Prometheus as a data source:
   - Click on "Configuration" (gear icon) > "Data Sources"
   - Click "Add data source"
   - Select "Prometheus"
   - Set URL to `http://localhost:9090`
   - Click "Save & Test"

## 4. Create Dashboard

1. Click on "+" > "Create Dashboard"
2. Add panels for each metric:

   a. System metrics:
   - CPU Usage: `100 - (avg by(instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)`
   - Memory Usage: `100 * (1 - ((node_memory_MemFree_bytes + node_memory_Cached_bytes + node_memory_Buffers_bytes) / node_memory_MemTotal_bytes))`
   - Disk Usage: `100 - ((node_filesystem_avail_bytes{mountpoint="/"} * 100) / node_filesystem_size_bytes{mountpoint="/"})`

   b. Story node metrics:
   - Latest Block Height: `story_latest_block_height`
   - Peers Count: `story_peers_count`
   - Validator Voting Power: `story_validator_voting_power`

3. Customize layout and visualizations as desired

## 5. Additional Metrics to Consider

- Transaction rate
- Block time
- Validator uptime
- Missed blocks
- Delegated stake amount

To add these metrics, you may need to extend the custom exporter (`story_exporter.py`) to fetch and expose this data from your Story node's API endpoints.

## Troubleshooting

1. Ensure all services are running:
   ```bash
   sudo systemctl status node_exporter prometheus grafana-server story_exporter
   ```
2. Check logs for any errors:
   ```bash
   sudo journalctl -u node_exporter
   sudo journalctl -u prometheus
   sudo journalctl -u grafana-server
   sudo journalctl -u story_exporter
   ```
3. Verify that Prometheus is scraping metrics:
   - Access `http://your_server_ip:9090/targets`
   - All targets should show as "UP"

## Security Considerations

- Configure firewall rules to restrict access to Grafana (port 3000) and other services
- Use strong passwords for Grafana and other components
- Consider setting up HTTPS for secure access to Grafana

Remember to regularly update all components to their latest versions to ensure security and optimal performance.