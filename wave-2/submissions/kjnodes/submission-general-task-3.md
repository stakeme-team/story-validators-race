# General Task 3: Story Grafana Dashboard

We provide a comprehensive [Story Node Monitoring stack project](https://github.com/kjnodes/story-node-monitoring#readme), consisting of multiple parts. Prometheus configuration ensures consistent metric collection. Grafana configuration ensures visualizations, including a prepared dashboard. Alertmanager enables Telegram notifications about important changes. The stack includes a quick-start Docker Compose configuration.

An example of the dashboard can be viewed at http://story-demo-dashboard.kjnodes.com:9999/d/frewgrege/stroy-node-dashboard.

If a user wants the monitoring stack on a local node, without reading a step-by-step guide, we provide a scripted installation as part of our [Story Node Configuration Script](https://github.com/kjnodes/story-node-configuration#readme) with the following one-line command:

```bash
bash <(curl -sL https://github.com/kjnodes/story-node-configuration/raw/refs/heads/main/script.sh) monitor
```
