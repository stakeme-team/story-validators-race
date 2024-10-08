# 💻 Story Node Grafana Dashboard 

## Dashboard Description:
This customized Grafana dashboard is designed to visualize critical metrics related to system performance and monitoring. Based on the extracted metrics from your data exporter, the dashboard includes:

- **CPU Utilization**: Displayed using a **gauge chart** for real-time monitoring of CPU usage percentage.
- **Memory Usage**: Visualized through a **gauge chart**, tracking memory consumption in megabytes (MB).
- **Count Metrics**: Key count metrics, such as transaction or request counts, are represented using **bar charts** to easily understand activity volume.
- **Distribution Metrics**: Any histogram or bucket data, such as response time distribution or latency, is shown using **heatmaps** to give insights into how values are spread over time.
- **Other Timeseries Metrics**: Additional performance data like network or disk IO is presented in **timeseries charts**, allowing you to track their behavior over time.

## Dashboard Template:
Here’s a template of your Grafana dashboard with the improvements applied: 🔗 [Link to Dashboard Template](https://github.com/mnhat3896/story-validators-node/blob/main/grafana-dashboard.json)

## Demo Link:
To view a demo of a similar dashboard, you can visit this link (Please wait a few seconds to let the dashboard loaded): 🔗
[**Demo Dashboard**](http://212.47.66.6:3000/public-dashboards/b9d01782d81e44378d7b1587ef497533?orgId=1&from=now-3h&to=now&refresh=30s)

## Installation Guide:

### ⚠️ Prerequisites :
- Ensure you have **Grafana** installed and running. 🔗 [Guide](https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/)
- Ensure you have **Prometheus** installed and running. 🔗 [Guide](https://www.cherryservers.com/blog/install-prometheus-ubuntu)
- Set up **Prometheus** as your data source to collect and query the metrics.

### Import the Dashboard:
- Download the 🔗 [Link to Dashboard Template](https://github.com/mnhat3896/story-validators-node/blob/main/grafana-dashboard.json) file.
- Go to **Grafana** → **Dashboards** → **New** → **Import**.
- Click on **Upload JSON file** and select the downloaded JSON file.

### Connect to Prometheus:
- Go to **Settings** → **Data Sources** → **Add Data Source**.
- Select **Prometheus** as your data source and configure it using the URL of your Prometheus instance.
- Save & Test the data source.

### ❤️ Customize and Apply:
- Once the dashboard is imported, verify that all panels are displaying data correctly.
- You may further tweak the visualizations, chart types, and data sources as needed.
