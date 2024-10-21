Please check:
[story-loki-grafana](https://github.com/neulerfzco/story-loki-grafana) for latest

(below is the README copy of the repository)
# Story monitoring tool 

This repository aims to simplify as much as possible the monitoring setup of a story validator / consensus full node.

## plug-and-play

- `init.sh` : setup the prometheus.yml file accordingly. Will setup node_exporter.service and docker engine if needed. 
- grafana dashboards and datasources provisioning: no extra setup needed, the dashboards are provisioned. 

## installation

```
git clone https://github.com/neulerfzco/story-loki-grafana.git
cd story-loki-grafana
./init.sh  
#User needs to logout once for the group change to take effect.
docker-compose up -d  
```

## dashboards
- `story-dashboard` : overview of the validator/full node metrics. 
 
- `Detailed Node Metrics` : detailed metrics of the hardware itself. [using this node exporter dashboard](https://github.com/rfmoz/grafana-dashboards) created by [rfmoz](https://github.com/rfmoz)


- `Logs` : story logs page with different sections.

