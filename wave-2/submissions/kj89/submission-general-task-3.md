# General Task 3: Story Grafana Dashboard

We provide a comprehensive [Story Node Monitoring stack project](https://github.com/kjnodes/story-node-monitoring#readme), consisting of multiple parts. Prometheus configuration ensures consistent metric collection. Grafana configuration ensures visualizations, including a prepared dashboard. Alertmanager enables Telegram notifications about important changes. The stack includes a quick-start Docker Compose configuration.

An example of the dashboard can be viewed at http://story-demo-dashboard.kjnodes.com:9999/d/frewgrege/stroy-node-dashboard.

If a user wants the monitoring stack on a local node, without reading a step-by-step guide, we provide a scripted installation as part of our [Story Node Configuration Script](https://github.com/kjnodes/story-node-configuration#readme) with the following one-line command:

```bash
bash <(curl -sL https://github.com/kjnodes/story-node-configuration/raw/refs/heads/main/script.sh) monitor
```

## Dashboard contents

The Grafana dashboard is organized into three main sections:

### 1. kjnodes Story Services

Contains links to kjnodes provided services for Story Protocol.

![image](https://raw.githubusercontent.com/kjnodes/story-node-monitoring/refs/heads/main/images/dashboard-kjnodes-services.png)

### 2. Cometbft Node Metrics

Displays key metrics for monitoring the health, performance, and activity of the CometBFT node.

#### 2.1. System

Shows system related metrics like node status, service uptime, memory and cpu usage.

![image](https://raw.githubusercontent.com/kjnodes/story-node-monitoring/refs/heads/main/images/dashboard-cometbft-system-metrics.png)

#### 2.2. Network

Network metrics like node peer connections and traffic.

![image](https://raw.githubusercontent.com/kjnodes/story-node-monitoring/refs/heads/main/images/dashboard-cometbft-network-metrics.png)

#### 2.3. Blockchain

Displays blockchain metrics like block time, blck size and information active validator set.

![image](https://raw.githubusercontent.com/kjnodes/story-node-monitoring/refs/heads/main/images/dashboard-cometbft-blockchain-metrics.png)

### 3. Geth Node Metrics

Shows metrics related to the health, resource consumption, and activity of the Geth node.

#### 3.1. System

Shows system related metrics like geth binary version and system resource consumption.

![image](https://raw.githubusercontent.com/kjnodes/story-node-monitoring/refs/heads/main/images/dashboard-geth-system-metrics.png)

#### 3.2. Network

Network metrics like node peer connections and traffic.

![image](https://raw.githubusercontent.com/kjnodes/story-node-monitoring/refs/heads/main/images/dashboard-geth-network-metrics.png)

#### 3.3. Blockchain

Displays blockchain metrics like block and transaction processing.

![image](https://raw.githubusercontent.com/kjnodes/story-node-monitoring/refs/heads/main/images/dashboard-geth-blockchain-metrics.png)

#### 3.4. Database

Displays database metrics like block time, blck size and information active validator set.

![image](https://raw.githubusercontent.com/kjnodes/story-node-monitoring/refs/heads/main/images/dashboard-geth-database-metrics.png)