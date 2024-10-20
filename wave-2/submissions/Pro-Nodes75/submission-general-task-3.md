We provide a comprehensive [Story Node Monitoring tool project](https://github.com/the-node75/mon_story?tab=readme-ov-file#story-node-monitoring-tool). 
Our unique monitoring project will allow you to control:
 * General server's metrics (CPU load, RAM/Swap usage, Storage, Network statistic);
 * CometBFT node monitoring (block height, peers cnt, VP, missed blocks, etc);
 * Geth node monitoring.

This Monitoring consist of the following parts:
 * **Prometheus** - embedded part for consistent metric collection;
 * **Telegraf agent** - collect data form Prometheus for InfluxDB;
 * **InfluxDB** - for storing metrics database;
 * **Grafana** - visual representation of collected data.

The stack includes a quick-start Docker Compose configuration.

Step by step setup process is described here:
https://github.com/the-node75/mon_story?tab=readme-ov-file#story-node-monitoring-tool
