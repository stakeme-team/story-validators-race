# Monitoring & Alerts


## Grafana dashboard for Story Protocol node

## Steps to install

### Enable Prometheus in the node config toml file and restart the node
```
sed -i.bak -e "s/^prometheus *=.*/prometheus = \"true\"/" $HOME/.story/story/config/config.toml
sudo systemctl restart story
```

#### Allow 3000 port on firewall to access the Grafana dasbhoard from the web
Most likely you will need to open 3000 port to publicly access the dashboard.
```
sudo ufw allow 3000
```

### Install dependencies

```
sudo apt install tar wget apt-transport-https software-properties-common
```

### Install Grafana, Prometheus and node exporter
#### Grafana
```
cd $HOME
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt update
sudo apt install grafana
```
##### Enable the service and start Grafana
```
sudo systemctl daemon-reload
sudo systemctl enable grafana-server.service
sudo systemctl start grafana-server.service
```
##### Check Grafana logs
```
sudo journalctl -u grafana-server.service -f -o cat
```

#### Prometheus

```
cd $HOME
wget -O prometheus.tar.gz https://github.com/prometheus/prometheus/releases/download/v2.54.1/prometheus-2.54.1.linux-amd64.tar.gz
tar -xvf prometheus.tar.gz
rm -v prometheus.tar.gz
sudo chmod +x $HOME/prometheus-2.54.1.linux-amd64/prometheus
sudo cp $HOME/prometheus-2.54.1.linux-amd64/prometheus /usr/local/bin/prometheus
```
##### Create Prometheus service
```
sudo tee /etc/systemd/system/prometheus.service << EOF
[Unit]
Description=Prometheus for Story Protocol
After=network-online.target

[Service]
User=$USER
ExecStart=/usr/local/bin/prometheus --config.file="$HOME/prometheus.yml" --web.listen-address=":9090"
RestartSec=3
Restart=on-failure
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF
```
##### Download Prometheus default config from Mandragora's GitHub (if necessary, change config values in $HOME/prometheus.yml)
```
wget https://raw.githubusercontent.com/McDaan/general/refs/heads/main/story/grafana/prometheus.yml
sudo cp prometheus.yml $HOME/prometheus.yml
```

##### Enable the service and start Prometheus
```
sudo systemctl daemon-reload
sudo systemctl enable prometheus.service
sudo systemctl start prometheus.service
```
##### Check Prometheus logs
```
sudo journalctl -u prometheus.service -f -o cat
```

#### Node exporter
```
cd $HOME
wget -O node_exporter.tar.gz https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz
tar -xvf node_exporter.tar.gz
rm -v node_exporter.tar.gz
sudo chmod +x $HOME/node_exporter-1.8.2.linux-amd64/node_exporter
sudo cp $HOME/node_exporter-1.8.2.linux-amd64/node_exporter /usr/local/bin/node_exporter
```
##### Create Node exporter service
```
sudo tee /etc/systemd/system/node-exporter.service << EOF
[Unit]
Description=Node Exporter for Story Protocol
After=network-online.target

[Service]
User=$USER
ExecStart=/usr/local/bin/node_exporter
RestartSec=3
Restart=on-failure
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF
```
##### Enable the service and start Node exporter
```
sudo systemctl daemon-reload
sudo systemctl enable node-exporter.service
sudo systemctl start node-exporter.service
```
##### Check Node exporter logs
```
sudo journalctl -u node-exporter.service -f -o cat
```

You now have access locally to your Grafana dashboard via `localhost:3000` (or remotely in case you open 3000 port) (you could also configure it with a Nginx config or depending on the needs). The default user and password tends to be `admin` and `admin` respectively - they can be changed at any moment afterwards.
## Apply a standard dashboard

You can download this standard Grafana dashboard we have prepared for Story Protocol, or from other providers. You just have to download the JSON file of a specific dashboard, and import it into the Grafana dashboards configuration (at `localhostt:3000` on default). In this specific case, most likely you will have to set your validator HEX address in the respective field at the top, as well as the instance `localhost:prometheusport`, i.e. commonly by default set to 26660 (so `localhoat:26660`).

```
wget https://raw.githubusercontent.com/McDaan/general/refs/heads/main/story/grafana/mandashboard.json
```


Well done! You successfully installed a standard Grafana dashboard backed by Prometheus metrics. You can now start exploring panels and playing around to add new useful metrics.
