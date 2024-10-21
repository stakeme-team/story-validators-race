# Story Grafana Dashboard

This project provides Grafana dashboard panels to monitor the **Story Protocol Consensus Node** and **Geth Execution Node**. You can import the `dashboard.json` file into your Grafana instance to start using it.

Demo: https://grafana.story.encapsulate.xyz/public-dashboards/d83bd674c638411a99f38b3676869fcb
---

## Visual Overview

### Geth Execution Node
![Geth Metrics Part 1](https://raw.githubusercontent.com/encapsulate-xyz/story-grafana/refs/heads/main/images/geth1.png)
![Geth Metrics Part 2](https://raw.githubusercontent.com/encapsulate-xyz/story-grafana/refs/heads/main/images/geth2.png)

### Story Consensus Node
![Consensus Metrics Part 1](https://raw.githubusercontent.com/encapsulate-xyz/story-grafana/refs/heads/main/images/consensus1.png)
![Consensus Metrics Part 2](https://raw.githubusercontent.com/encapsulate-xyz/story-grafana/refs/heads/main/images/consensus2.png)

---

## Guide

1. Open Grafana and navigate to **+** -> **Import**.
2. Upload the `dashboard.json` file from [here](https://github.com/encapsulate-xyz/story-grafana/blob/main/dashboard.json) or paste its contents.
3. Assign the appropriate data source for your metrics.

Now you can start monitoring your Story Protocol and Geth nodes with ease.