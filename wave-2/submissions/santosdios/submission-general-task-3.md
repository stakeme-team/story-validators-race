# Story Metrics and Grafana Dashboard
![PortadaGithub (3)](https://github.com/user-attachments/assets/57b006a4-1d59-4b90-8447-0ccbca335ae1)

This repository contains detailed information about Story metrics and the associated Grafana dashboard.  

## First steps  

Modify the config.toml file in $HOME/.story/story/

```bash
prometheus = true
prometheus_listen_addr = ":26660"
```
![image](https://github.com/user-attachments/assets/fafc4510-efd8-4799-a304-4ed6e6970ef4)


Restart node:  
```bash
sudo systemctl restart story
sudo journalctl -u story -f
```

Check Prometheus:
Open a browser and use the url: 26660
http://(your node IP)/26660

Or check it on your server:
```bash
curl http://localhost:26660/metrics
```
![image](https://github.com/user-attachments/assets/22b1c52e-c9b9-4d94-bfa8-b3cd3166d0f3)

## Configure Prometheus  

Log in to your Prometheus server and edit the configuration file:
/etc/prometheus/prometheus.yml

```bash
- job_name: storyRPC
  static_configs:
  - targets: ['(your node IP):26660']
```

Restart Prometheus:
```bash
sudo systemctl restart prometheus
sudo journalctl -u prometheus -f --no-hostname -o cat
```

## Story Metrics

Story metrics provide essential information for monitoring and evaluating the performance and status of the Story network. These metrics cover a wide range of aspects, from block height to total bandwidth usage.

For a complete description of the available metrics, check out the metrics document below.

[![Metrics](https://img.shields.io/badge/Metrics-View%20Metrics-blue?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Cumulo-pro/Story_protocol/blob/main/monitoring/story_metrics.md)

## Grafana Dashboard

The Grafana dashboard for Story metrics provides an interactive, real-time visualization of all relevant data. This dashboard facilitates continuous monitoring of the network's status and quick identification of any potential issues.

You can download the Grafana dashboard from the links below:

[![Grafana Dashboard](https://img.shields.io/badge/Grafana%20Dashboard-Download-blue?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Cumulo-pro/Story_protocol/blob/main/monitoring/Story%20Dashboard%20by%20Cumulo-1728540668028.json)


[![Official Grafana Dashboard](https://img.shields.io/badge/Grafana%20Dashboard-Official%20Download-blue?style=for-the-badge&logo=grafana&logoColor=white)](https://grafana.com/grafana/dashboards/22059-story-dashboard-by-cumulo/)
---

## Grafana Dashboard demo online  

You can download the Grafana dashboard from the links below:

[![Grafana Dashboard Demo](https://img.shields.io/badge/Grafana%20Dashboard-Demo%20Online-blue?style=for-the-badge&logo=grafana&logoColor=white)](http://74.208.16.201:3000/public-dashboards/17c6d645404a400f8aa7c3c532fd4a61?orgId=1&refresh=5s)
