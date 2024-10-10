# STORY Validator Monitoring Dashboard Setup

This guide provides instructions on setting up and using dashboards to monitor the health and performance of STORY ecosystem validator nodes. These dashboards, powered by Grafana and Prometheus, allow operators to view key metrics, helping them maintain node uptime and prevent slashing by tracking signing behavior.

## Dashboard Overview

We have set up two key dashboards that you can access to monitor the performance of your validator nodes in the STORY ecosystem and associated Geth nodes:

1. **STORY Validator Monitoring Dashboard**  
   URL: [STORY Validator Dashboard](https://story-dashboard.bharvest.io/d/UJyurCTWz/story-dashboard?orgId=1)  
   This dashboard provides real-time insights into validator performance, including block signing statistics, missed signatures, and general node health within the STORY ecosystem.

2. **Geth Node Monitoring Dashboard**  
   URL: [Geth Node Dashboard](https://story-dashboard.bharvest.io/d/FPpjH6Hik/geth-dashboard?orgId=1&refresh=10s)  
   This dashboard is focused on monitoring the Geth nodes, displaying critical metrics like peer connectivity, memory usage, block sync status, and more.

> **Login Credentials**:  
> Username: `user`  
> Password: `user`

## Dashboard Installation Guide

To set up these dashboards for monitoring, follow the steps below:

### Step 1: Install Prometheus and Grafana

1. **Install Prometheus**  
   Prometheus is used to scrape metrics from your validator nodes and store them for analysis. Follow the official Prometheus installation guide [here](https://prometheus.io/docs/prometheus/latest/installation/).

2. **Install Grafana**  
   Grafana is used to visualize the metrics collected by Prometheus. Install Grafana by following the official guide [here](https://grafana.com/docs/grafana/latest/setup-grafana/).

### Step 2: Import Dashboard Templates

1. **Download the JSON templates**

   - [STORY Validator Dashboard Template](https://raw.githubusercontent.com/zeroN0de/story-validators-race/refs/heads/scripts/wave-2/submissions/B-Harvest/story-grafana.json)
   - [Geth Node Dashboard Template](https://raw.githubusercontent.com/zeroN0de/story-validators-race/refs/heads/scripts/wave-2/submissions/B-Harvest/geth-grafana.json)

2. **Import the templates into Grafana**
   - Open Grafana and log in.
   - Go to **Dashboard** > **Manage** and click **Import**.
   - Upload the JSON file for the desired dashboard, or use the provided dashboard ID to import from Grafana's online repository.

### Step 3: Configure Prometheus

Configure Prometheus to scrape metrics from your nodes by editing your `prometheus.yml` configuration file. Add your nodes' addresses to the `scrape_configs` section like so:

```yml
scrape_configs:
  - job_name: "story_validator"
    static_configs:
      - targets: ["<node-ip>:26660"]

  - job_name: "geth_node"
    metrics_path: /debug/metrics/prometheus
    static_configs:
      - targets: ["localhost:6060"]
```

### Step 4: Visualize Metrics

Once you've set up Prometheus and Grafana, navigate to the respective dashboard URLs provided above. You should see real-time metrics reflecting the performance of your STORY validator and Geth nodes.

## Demo Links

- [STORY Validator Dashboard](https://story-dashboard.bharvest.io/d/UJyurCTWz/story-dashboard?orgId=1)
- [Geth Node Dashboard](https://story-dashboard.bharvest.io/d/FPpjH6Hik/geth-dashboard?orgId=1&refresh=10s)

For additional context and further customization options, refer to the official [Prometheus](https://prometheus.io/docs/introduction/overview/) and [Grafana](https://grafana.com/docs/grafana/latest/getting-started/introduction/) documentation.
