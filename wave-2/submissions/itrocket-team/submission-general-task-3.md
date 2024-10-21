<img src="https://github.com/mART321/story/blob/main/img/1story.png" alt="Grafa banner" style="width: 100%; height: 100%; object-fit: cover;" />

# Story Grafana Dashboard by ITRocket
> This dashboard includes blockchain overview, validator data (uptime, missing blocks), block parameters, transactions & gas data, staking parameters, Geth overview, system health monitoring. Custom Prometheus exporter was developed as well to display additional validator metrics. Finally, alerts can be easily configured if needed.

✅ **Grafana Dashboard:** https://grafana-story.itrocket.net/d/fe1cy2e7cydc0f/story-dashboard?orgId=1  
✅ **Json data:** https://github.com/itrocket-team/testnet_guides/blob/main/story/monitoring/dashboard.json

- [Grafana Dashboard Functionality](#grafana-dashboard-functionality)
  - [Validator Data](#validator-data)
  - [Block Parameters](#block-parameters)
  - [Transactions & Gas](#transactions-gas)
  - [Staking](#staking)
  - [GETH Overview](#geth-overview)
  - [System Health](#system-health)
- [Installation Guide](#installation-guide)
  - [System Requirements](#system-requirements)
  - [Install Node Exporter](#install-node-exporter)
  - [Install Prometheus](#install-prometheus)
  - [Install Grafana](#install-grafana)
  - [Custom Node Exporter](#custom-node-exporter)

<img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/story_1.png" alt="Grafa banner x" style="width: 100%; height: 100%; object-fit: cover;" />


# Grafana Dashboard Functionality

###### 💡 Click ► to open/close image  

### Validator Data 👨‍💻  <a id="validator-data"></a>
<details open>
  <summary>A quick overview of validator performance and health: validator's bond and jail status, addresses, unbonding time, as well as missed blocks and uptime for the last 24 hours and 5 minutes. </summary>
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/story_2.png" style="width: 100%; height: 100%; object-fit: cover;" />
</details>

### Block parameters ⛓️  <a id="block-parameters"></a>
<details open>
  <summary>Key block parameters like block size, interval times, and block time rate. It also shows the timing metrics for various ABCI methods, including commit, extend_vote, and finalize_block, with mean, last, max, and min values.</summary>
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/story_3.png" style="width: 100%; height: 100%; object-fit: cover;" />
</details>

### Transactions and Gas 🔄  <a id="transactions-gas"></a>
<details open>
  <summary>Statistics on transactions and gas usage, including the total number of transactions, their success rate, gas fees, and the state of the transaction pool.</summary>
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/story_4.png" style="width: 100%; height: 100%; object-fit: cover;" />
</details>

### Staking 💰 <a id="staking"></a>
<details open>
  <summary>Metrics related to staking, such as minted tokens, delegate and undelegate transactions, and the staking queue status.</summary>
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/story_5.png" style="width: 100%; height: 100%; object-fit: cover;" />
</details>

### Geth Overview 🔍  <a id="geth-overview"></a>
<details open>
  <summary>Information about the GETH client version, network traffic, peers (total, inbonding, and outbonding), and block processing, helping to monitor node status and network interaction.</summary>
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/story_6.png" style="width: 100%; height: 100%; object-fit: cover;" />
</details>

### System Health 📉  <a id="system-health"></a>
<details open>
  <summary>System metrics: CPU load, memory usage, disk usage parameters, and server uptime, helping to monitor system performance and stability.</summary>
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/story_7.png" style="width: 100%; height: 100%; object-fit: cover;" />
</details>

# Installation Guide <a id="installation-guide"></a>
### System Requirements ⚙️  <a id="system-requirements"></a>
```
- System: Ubuntu 20.04 or newer
- RAM: 4GB or more
- CPU: 2 cores or more
- Storage: 20GB
```

Enable prometheus on story node config.toml
~~~
prometheus = true
prometheus_listen_addr = ":26660"
~~~

Enable geth metric to adding `--metrics --metrics.addr 0.0.0.0 --metrics.port 6060` on geth start command

### Install Node Exporter ⬇️   <a id="install-node-exporter"></a>   
❗ Install on the validator node server   
~~~
cd $HOME
rm -rf node_exporter-*.*-amd64
curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest | grep "browser_download_url.*linux-amd64" | cut -d '"' -f 4 | wget -qi -
tar xvfz node_exporter-*.*-amd64.tar.gz
cd node_exporter-*.*-amd64
chmod +x node_exporter
sudo cp node_exporter /usr/local/bin/
node_exporter --version
~~~


Create service file
```
sudo tee /etc/systemd/system/node-exporter.service <<EOF
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=$USER
ExecStart=$(which node_exporter) --web.listen-address=:9200
Restart=on-failure
RestartSec=3

[Install]
WantedBy=default.target
EOF
```


Enable and start Node Exporter
```
sudo systemctl daemon-reload
sudo systemctl enable node-exporter
sudo systemctl restart node-exporter && sudo journalctl -u node-exporter -f
```

### Install Prometheus 🛰️   <a id="install-prometheus"></a>
💡 Recommended to install on a separate server  

Create user  
```
sudo useradd --no-create-home --shell /bin/false prometheus
sudo groupadd --system prometheus
sudo usermod -aG prometheus prometheus
```

Download and unpack Prometheus  
```
cd $HOME
[ ! -d /etc/prometheus ] && mkdir -p /etc/prometheus
[ ! -d /var/lib/prometheus ] && mkdir -p /var/lib/prometheus
rm -rf tmp/prometheus /etc/prometheus/consoles /etc/prometheus/console_libraries
mkdir -p tmp/prometheus && cd tmp/prometheus
curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -
tar xvf prometheus*.tar.gz
rm prometheus*.tar.gz
cd prometheus*
sudo mv prometheus promtool /usr/local/bin/
sudo mv consoles console_libraries /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus /usr/local/bin/prometheus /usr/local/bin/promtool /var/lib/prometheus
prometheus --version
promtool --version
```

Create prometheus.yml file
Your story node ip address
```
NODE_IP=xxx.xxx.xxx.xx
```

Create prometheus.yml
```
cat <<EOF | sudo tee /etc/prometheus/prometheus.yml
global:
  scrape_interval: 5s
  scrape_timeout: 3s

# Alertmanager configuration
alerting:
  alertmanagers:
  - static_configs:
    - targets: ['localhost:9093']

scrape_configs:
  # The job name is added as a label \`job=<job_name>\` to any timeseries scraped from this config.
  - job_name: 'prometheus'
    scrape_interval: 5s
    scrape_timeout: 3s
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'node-exporter'
    scrape_interval: 5s
    scrape_timeout: 3s
    static_configs:
      - targets: ['${NODE_IP}:9200']
  
  - job_name: 'Story'
    scrape_interval: 5s
    scrape_timeout: 3s
    static_configs:
      - targets: ['${NODE_IP}:26660']

  - job_name: 'geth_node'
    scrape_interval: 5s
    scrape_timeout: 3s
    metrics_path: /debug/metrics/prometheus
    static_configs:
      - targets: ['${NODE_IP}:6060']
EOF
```

Create service file
```
sudo tee /etc/systemd/system/prometheus.service<<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
ExecReload=/bin/kill -HUP \$MAINPID
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries \
    --web.listen-address=0.0.0.0:9099 

Restart=on-failure
RestartSec=5
TimeoutStopSec=20s
LimitNOFILE=8192
ProtectSystem=full
ProtectHome=yes
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
EOF
```

Enable and start Prometheus
```
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl restart prometheus && sudo journalctl -u prometheus -f
```

### Install Grafana 🛠️  <a id="install-grafana"></a>
💡 Recommended to install on a separate server  
```
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update
sudo apt install grafana
sudo systemctl start grafana-server
sudo systemctl status grafana-server
```

Open browser and and navigate to `http://<your_server_ip>:3000`
> Default login and password are admin/admin. After log in, change your password.

### Custom Node Exporter 🚀 <a id="custom-node-exporter"></a>  
Some metrics may be unavailable without custom node exporter. Feel free to use this repo to configure it:  
🔗 https://github.com/itrocket-team/testnet_guides/tree/main/story/prometheus_exporter
