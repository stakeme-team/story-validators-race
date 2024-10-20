This script is used to set up and configure Prometheus and Grafana for monitoring a Story node.

Use the following command in your terminal:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/0x1Levi/story-general-tasks/main/general_task3.sh)
```



The script performs the following tasks:

 - Updates and upgrades the system.
 - Installs necessary dependencies.
 - Ensures the script is run as root.
 - Retrieves the status of the Story node.
 - Creates necessary directories for Prometheus.
 - Downloads and extracts Prometheus.
 - Defines the Prometheus configuration.
 - Creates and starts the Prometheus service.
 - Installs and starts Grafana.
 - Installs and starts Prometheus Node Exporter.
 - Configures Grafana to use a new port.
 - Enables Prometheus monitoring in the Story configuration.
 - Configures Prometheus data source in Grafana.
 - Imports a Grafana dashboard for monitoring the Story node.
