
# Story Validator Grafana Dashboard

## Demo

https://telemetry.story.stakin-nodes.com/public-dashboards/106808cdb1884751b3da21038c5f642b


## Install instructions

### Hardware recommendations

- Operating System: Ubuntu 22.04 LTS
- Minimum RAM: 512MB
- Minimum CPU:  1
- Minimum disk: 10GB

### Install utils

- Install pre-requisites

```sh
sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common wget tar
```

- Install Node exporter

```sh
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar -xvf node_exporter-1.5.0.linux-amd64.tar.gz
mkdir /usr/local/bin/node_exporter
sudo mv ./node_exporter-1.5.0.linux-amd64 /usr/local/bin/node_exporter
rm node_exporter-1.5.0.linux-amd64.tar.gz
```

- Install Prometheus

```sh
wget https://github.com/prometheus/prometheus/releases/download/v2.30.2/prometheus-2.30.2.linux-amd64.tar.gz
tar -xvf prometheus-2.30.2.linux-amd64.tar.gz
sudo mv ./prometheus-2.30.2.linux-amd64 /usr/local/bin/prometheus
rm prometheus-2.30.2.linux-amd64.tar.gz
```



- Install Grafana Stable

```sh
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install grafana
```

Health check for Grafana:

```sh
curl localhost:3000/api/health

```
Check logs:

```sh
sudo journalctl -fu grafana-server -o cat 
```

### Configure Prometheus


- Download prometheus.yml to the prometheus config dir

```sh
wget https://raw.githubusercontent.com/StakinOfficial/story-tasks/refs/heads/main/story-tasks/story-dashboard/grafana/provisioning/prometheus.yml
sudo mv prometheus.yml /usr/local/bin/prometheus/prometheus.yml
sudo systemctl restart prometheus.service
```

- (Optionally) Edit /etc/hosts 

Add a new entry in `/etc/hosts` for `story-testnet` to your validator ip address.


## Dashboard template

Download the `story-dashboard.json` file and import it into a new dashboard on the grafana UI client available on `0.0.0.0:3000`.

```sh
wget https://raw.githubusercontent.com/StakinOfficial/story-tasks/refs/heads/main/story-tasks/story-dashboard/grafana/dashboards/story-dashboard.json

```


