# Submission for General Task 3: Grafana Dashboard

## Overview

This submission provides a Grafana dashboard setup for monitoring the Story validator. The setup includes Prometheus for data collection, Node Exporter for system metrics, and Grafana for visualization.

## Dashboard Example

STORY_Validator_Status
https://nodeinfra.grafana.net/public-dashboards/b9983f2ab0c14d2eade1c49431c8ae7a

STORY_Validator_Performance
https://nodeinfra.grafana.net/public-dashboards/fb7ee27460cd41e98c5d3fb73f701e04



## Installation Guide

1. Clone the repository:
   ```
   git clone https://github.com/s3unghyeon/story_setup.git
   cd story_setup/task3
   ```

2. Create a `.env` file with the following content:
   ```
   GRAFANA_ADMIN_USER=your_username
   GRAFANA_ADMIN_PASSWORD=your_password
   NODE_IP='node_ip'
   ```

3. Start the services using Docker Compose:
   ```
   docker-compose up -d
   ```

4. Access Grafana at `http://localhost:3000` and log in with the credentials set in the `.env` file.

## Dashboard Contents

The Grafana setup includes two main dashboards:

1. **Validator Performance Dashboard**
   - Block height comparisons
   - Voting power statistics
   - Validator metrics (missed blocks, last signed height)
   - Network and peer information

2. **Validator Status Dashboard**
   - System health metrics (CPU, RAM, Disk usage)
   - Node information
   - Hardware temperatures
   - Network traffic statistics
   - Disk I/O metrics

## Key Features

- Real-time monitoring of validator performance
- System resource utilization tracking
- Network and peer connectivity insights
- Easy-to-read visualizations for quick status checks

## Customization

You can customize the dashboards by editing the JSON files in the `dashboards` directory. After making changes, restart the Grafana container to apply the updates.

## Troubleshooting

If you encounter issues:
1. Check Docker container logs: `docker-compose logs`
2. Ensure all services are running: `docker-compose ps`
3. Verify Prometheus configuration in `prometheus-config.yaml`

