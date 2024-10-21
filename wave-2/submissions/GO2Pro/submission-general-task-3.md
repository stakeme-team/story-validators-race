## Overview
This Bash script provides a one-line silent installation for setting up Prometheus, Node Exporter, and Grafana using Docker containers. It automates the deployment process, including configuring custom ports, setting up Prometheus as a data source, and installing a pre-configured Grafana dashboard.

## Features
- One-Line Silent Install: The script installs and configures all components without requiring user interaction.
- Docker-Based Setup: All services (Prometheus, Node Exporter, and Grafana) run in Docker containers, simplifying installation and isolation.
- Custom Ports: The following ports are used:
  - Prometheus: 9094 (mapped to Prometheus internal port 9090)
  - Grafana: 9093 (mapped to Grafana’s internal port 3000)
  - Node Exporter: 9095 (mapped to Node Exporter internal port 9100)
  - Alertmanager (if enabled): 9096
- Prometheus Data Source: Automatically configures Prometheus as a data source in Grafana.
- Grafana Dashboard: A predefined Grafana dashboard is downloaded and installed, providing immediate visualization of the collected metrics.

## Quick Start
To deploy the node, execute the following command in your Ubuntu terminal:
```bash
wget -q -O story_grafana_installer.sh https://api.go2pro.xyz/story_grafana_installer.sh && sudo chmod +x story_grafana_installer.sh && ./story_grafana_installer.sh
```

## Repository Link
The script is hosted on GitHub, accessible here:
```
https://github.com/GO2Pro/nodes/blob/main/story/one-liner/story_grafana_installer.sh
```
