# 📊 Story Monitoring Dashboard

**Built by Stake-Take**

## Overview

The Story Monitoring Dashboard provides a comprehensive view of validator performance and network health within the Story blockchain ecosystem. It consolidates critical metrics, enabling operators and administrators to monitor validator status, system performance, and network activity efficiently.

### [Access the Dashboard Here](https://story.stake-take.com/grafana)

## Key Features

### System Metrics
- **CPU Usage:** Tracks the CPU load on validator nodes to identify potential bottlenecks.
- **Memory Usage:** Monitors memory allocations and consumption, including Go process allocations and system memory utilization.
- **Disk I/O:** Displays disk input/output operations to assess storage performance.

### Blockchain Metrics
- **Current Chain Height:** Shows the latest block height, monitoring network progression and synchronization status.
- **Transaction Count:** Indicates the number of transactions processed in a given timeframe.
- **Gas Used:** Measures total gas consumption, providing insights into network utilization and congestion levels.

### Consensus Metrics
- **Current Consensus Round:** Indicates the block agreement process stage.
- **Current Consensus Step:** Provides detailed insights into the block validation process.
- **Consensus Block Interval (95th Percentile):** Represents the time interval between blocks, indicating network latency.

### Validator Monitoring
- **Validator List:** A table detailing each validator's performance and status:
  - **Moniker:** The validator's display name.
  - **Operator Address:** Clickable links redirecting to the validator's page on the explorer.
  - **Status:** Indicates validator status (active, warning, inactive) using color codes.
  - **Tokens:** Total tokens delegated to the validator.
  - **Delegator Shares:** Indicates the level of support.
  - **Commission Rate:** The commission percentage charged by the validator.
  - **Jailed:** Indicates whether the validator is jailed.

### Network Metrics
- **Network Traffic (Ingress/Egress):** Monitors incoming and outgoing network traffic.
- **Connected Peers:** Displays active peer connections.

### Application Metrics
- **Go Memory Allocated:** Tracks memory usage by Go processes.
- **Garbage Collection Duration:** Measures time for garbage collection processes.
- **ABCI Commit Method Execution Time:** Monitors ABCI commit method execution time.

### Geth Metrics
- **Geth Information:** Provides version and configuration details of the Geth client.
- **Database State:** Shows read/write operations and the state of Ethereum database health.
- **Downloader Metrics:** Tracks data download efficiency.
- **Fetcher Metrics:** Monitors transaction fetcher integrity and propagation.

## Functional Features
- **Clickable Explorer Links:** Quick access to validator information via the "Validator List" table.
- **Thresholds and Color Indicators:** Immediate visual cues for health and performance (green for optimal, orange for warnings, red for critical issues).
- **Alerts and Notifications:** Configured alerts for deviations or issues, ensuring prompt responses.
- **Dynamic Filtering:** Filters specific validators for targeted monitoring and analysis.

## Technical Details
### Data Sources
- **Prometheus:** Primary data source collecting and aggregating metrics.
- **JSON API:** Fetches validator-specific information.

### Data Transformations
- **Extract Fields:** Converts JSON responses into a tabular format.
- **Filter Fields by Name:** Displays only relevant data fields.
- **Organize:** Renames and structures fields for readability.

### Visualization
- **Tables:** Displays detailed validator information.
- **Time Series Graphs:** Tracks metric trends over time.
- **Gauges and Status Indicators:** Provides quick visual assessments of system health.

### Technologies and Plugins Used
- **Grafana:** Visualization platform for dashboard management.
- **Prometheus:** Monitoring toolkit for data collection.
- **marcusolsson-json-datasource:** Plugin for JSON API integration.
- **Font Awesome:** Icon toolkit for visual enhancement.

## Setup Instructions

### Prerequisites
- **Grafana Instance**: Ensure you have Grafana set up.
- **Prometheus Data Source**: Configure Prometheus as the primary data source.
- **marcusolsson-json-datasource Plugin**: Install this plugin for JSON data source integration.

### Import the Dashboard
1. Open your Grafana instance.
2. Navigate to **Dashboards** > **Import**.
3. Paste the JSON configuration of the dashboard (found in this repository) and select the appropriate data source.

## 📞 Support
If you encounter issues or have questions, reach out to us through the following channels:
- **Email**: [support@stake-take.com](mailto:support@stake-take.com)
- **Twitter**: [@StakeAndTake](https://twitter.com/StakeAndTake)
- **Website**: [stake-take.com](https://stake-take.com)

## 🔄 Updates
The dashboard is regularly updated to align with developments in the Story network. Check for updates to benefit from new features and improvements.

## 📚 Additional Recommendations
To further enhance the dashboard:
- **Automated Updates**: Implement automatic updates for the dashboard configuration and plugins.
- **Backup and Restore**: Regularly backup configurations before updates.
- **Enhanced Security**: Integrate integrity checks for downloaded data sources and plugins.
- **Advanced Monitoring**: Include peer connection health checks and performance alerts.
- **Comprehensive Documentation**: Develop detailed guides addressing common issues.

Thank you for choosing **StakeTake** for your Story node monitoring and management needs! 🚀
