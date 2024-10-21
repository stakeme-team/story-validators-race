https://github.com/lesnikutsa/story/tree/main/dashboard

# Grafana Installation Guide for Story Node

More about the dashboard [here](https://grafana.com/grafana/dashboards/22119-story-dashboard-by-let-s-node/)


## Introduction

This guide provides step-by-step instructions on how to install and set up a Dashboard for monitoring a Story node and key hardware performance metrics  

**Note**: It is recommended to install Grafana and Prometheus on a separate server. On the server running your Story node, install Node Exporter, enable Prometheus in the node configuration, and add metrics flags to story-geth. This setup ensures optimal performance and easier management. More details on configuration can be found below

**Note**: If you set up AlertManager on the Grafana and Prometheus server, you will be able to receive notifications in Telegram or Discord about node problems, for example, when the service file story does not work

## Prerequisites

Before you begin, ensure you have the following:

- **Grafana** installed on your system. If not, download it from the [official website](https://grafana.com/docs/grafana/latest/setup-grafana/installation/).
- A configured Prometheus data source for your Node in Grafana, along with the Node Exporter added to collect hardware metrics
- Can use this [guide to install](https://utsa.gitbook.io/services/cosmos-wiki/node-exporter-+-grafana-+-prometheus-+-alertmanager) 

## Installation Steps

1. **Access Grafana**

   Open your web browser and navigate to your Grafana instance, typically at `http://<your_ip>:3000`, or use your domain name if a web server is configured.

2. **Import the Dashboard**

   - Click on the **"+"** icon on the left sidebar
   - Select **"Import"** from the dropdown menu

3. **Upload the Dashboard**

 Option 1: Upload the JSON File
   - In the **"Import via panel json"** section, click on **"Upload .json File"**.
   - Select the downloaded JSON file
 Option 2: Import via Dashboard UID
   - In the "Import via panel json" section, enter the Dashboard UID: `22119`
   - Click "Load" and confirm the dashboard settings

4. **Configure the Dashboard**

   - Once the JSON is uploaded, Grafana will display the dashboard title and other details
   - Choose the **Prometheus** **data source** from the dropdown menu if prompted
   - Click **"Import"** to complete the process

## Configuration
In the Prometheus configuration on the node server, you need to add the following three endpoints: Prometheus node, Geth metrics, and Node Exporter metrics.
```
  - job_name: 'prometheus'
    static_configs:
    - targets: ['<your_server_ip>:<prometheus_node_port>','<your_server_ip>:<node_exporter_port>','<your_server_ip>:<geth_metrics_port>']
      labels:
        label: 'Story'
    relabel_configs:
      - source_labels: [__address__]
        regex: '<your_server_ip>:<geth_metrics_port>'
        target_label: __metrics_path__
        replacement: '/debug/metrics/prometheus'
```
## Variables Adjustment: The dashboard uses variables, so make sure to specify the host and ports accordingly

- To enable Prometheus metrics for the node, set the value to true and open the corresponding port in the configuration file (default path: .story/story/config/config.toml)
```
prometheus = true
# Address to listen for Prometheus collector(s) connections
prometheus_listen_addr = "0.0.0.0:26660"
```
- To enable Geth metrics, add the following flag to the service configuration:
``` 
--metrics --metrics.addr 0.0.0.0 --metrics.port 6060
```
- If Node Exporter is not installed on your server, use this [guide](https://utsa.gitbook.io/services/cosmos-wiki/node-exporter-+-grafana-+-prometheus-+-alertmanager#node-exporter) to install and configure Node Exporter with Prometheus.

- **Data Source Verification**: Double-check that the dashboard panels are pulling data from the correct data source

## Usage

- Navigate through the dashboard to view your metrics
- Specify variable values ​​for the desired instance and ports
- Customize panels as needed by clicking on the panel title and selecting **"Edit"**
- Save any changes by clicking on the **"Save"** icon at the top right corner

## Support

If you encounter any issues or have questions, feel free to open an issue on the [GitHub repository](#).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
