# Story Grafana Dashboard

- Public Dashboard https://dashboard.evecoin.io/d/UJyurCTWz/helios-story?orgId=1&from=1729270800000&to=1729318465388

- JSON file: https://gist.github.com/linhtrang1602/c76fc42b95d9ad7569a2e6f535317fc7

# Setup
To get the dashboard working, you will need Prometheus and Grafana installed in your system. Follow these official documentiation on how to install Prometheus and Grafana in your system.
 - Grafana: https://grafana.com/docs/grafana/latest/setup-grafana/installation/
 - Prometheus: https://prometheus.io/download/

In Prometheus install instruction, you will find a configuration file `prometheus.yml`. Edit the file and change this line so Prometheus can collect metrics info from Story
```yaml
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: "Story" # Your job name

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["<story-ip>:26660"] # Story Prometheus endpoint
```

To check if Prometheus endpoint is enabled in Story, go to `$HOME/.story/story/config/config.toml` and make sure the configuration should look like this:
```toml
#######################################################
###       Instrumentation Configuration Options     ###
#######################################################
[instrumentation]

# When true, Prometheus metrics are served under /metrics on
# PrometheusListenAddr.
# Check out the documentation for the list of available metrics.
prometheus = true

# Address to listen for Prometheus collector(s) connections
prometheus_listen_addr = ":26660" # or any other port if 26660 is already used
```

After changing config, you will need to restart Story service to apply changes.
```bash
sudo systemctl restart story
```

Now you can start Prometheus service and it will start listening on port `9090`. If port `9090` is not available, you can add this flag `--web.listen-address 0.0.0.0:<port>` into the execute command.

To have Grafana dashboard running, run this command:
```bash
sudo systemctl restart grafana-server
```
The dashboard should be up and running at this address: `http://<your-ip>:3000`. After having access in the dashboard and changing the default password, you now can create new dashboard and import our JSON file with steps below:
-  **Add Data Source**:
   - Click on `Connections` > `Data Sources`.
   - Choose `Prometheus` as the data source type.
   - Add the Prometheus server URL: `http://<your-ip>:9090`.
   - Click `Save & Test`.
- **Import Dashboard**:
   - Go to `Dashboards` > `New Dashboard`.
   - Click on `Import Dashboard`.
   - Upload, or paste our dashboard JSON file: [Grafana JSON file](https://gist.github.com/linhtrang1602/c76fc42b95d9ad7569a2e6f535317fc7).