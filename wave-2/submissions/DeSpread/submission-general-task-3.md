![Story Protocol DeSpread Banner](https://raw.githubusercontent.com/DeSpread/story-validator/refs/heads/main/story-validators-race/wave-2/despread.jpg)

# Story Validator Grafana Dashboard By DeSpread

## Grafana Official Dashboard Link
- [Grafana Official Dashboard: "Story Validator Dashboard By DeSpread"](https://story-dashboard.shachopra.com/public-dashboards/64b43909c39142b2afbe4951f8cfb93a)
- [Grafana Dashboard JSON file](https://raw.githubusercontent.com/DeSpread/story-validator-monitoring/refs/heads/main/story-dashboard-by-despread.json)

## Demo Link
To see a demo of a similar dashboard, you can visit this link
- [Demo Dashboard By DeSpread](http://testnet.story.despreadlabs.io:3000/public-dashboards/d5ff4330fa5444d099e0c89a8ba155dc)

## Installation Guide

### 1. Install Docker
To begin, you need to have Docker installed. You can follow the official Docker installation guide:
- [Docker Installation on Ubuntu](https://docs.docker.com/engine/install/ubuntu)

### 2. Create Directories for Grafana
```bash
mkdir -p $HOME/docker/grafana
cd $HOME/docker/grafana
```

### 3. Configure Story Node Exporter
Edit the Story node configuration file to enable Prometheus metrics:
```bash
vi $HOME/.story/story/config/config.toml
```

Ensure that the Prometheus endpoint is enabled:
```toml
# Make sure Prometheus is set to true
prometheus = true
prometheus_listen_addr = 26660
```

You'll need to restart the Story node to allow access to the Prometheus endpoint.

### 4. Configure Prometheus
Create or edit the Prometheus configuration file (`prometheus.yml`) to add scrape targets:
```bash
vi prometheus.yml
```

Add the following configuration:
```yaml
global:
  scrape_interval: 15s
  scrape_timeout: 10s
  evaluation_interval: 15s

alerting:
  alertmanagers:
    - static_configs:
        - targets: []
      scheme: http
      timeout: 10s
      api_version: v1

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["<your-ip>:9090"]
  - job_name: "story"
    static_configs:
      - targets: ["<your-ip>:26660"]
```
Replace `<your-ip>` with your server's IP address.

### 5. Configure Docker Compose for Grafana and Prometheus
Create a Docker Compose configuration file for deploying Grafana and Prometheus:

1. Create an environment file (`.env`) to store the Grafana admin credentials:
```bash
vi .env
```
```dotenv
GF_SECURITY_ADMIN_USER=user
GF_SECURITY_ADMIN_PASSWORD=user
```

2. Create the Docker Compose file (`docker-compose.yml`):
```bash
vi docker-compose.yml
```
```yaml
version: '3.8'

services:
  grafana:
    image: grafana/grafana:11.2.2
    container_name: grafana
    restart: unless-stopped
    ports:
      - '3000:3000'
    volumes:
      - grafana-storage:/var/lib/grafana
    environment:
      - GF_SECURITY_ADMIN_USER=${GF_SECURITY_ADMIN_USER}
      - GF_SECURITY_ADMIN_PASSWORD=${GF_SECURITY_ADMIN_PASSWORD}
    networks:
      - shared

  prometheus:
    image: prom/prometheus:v2.54.1
    container_name: prometheus
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
    ports:
      - '9090:9090'
    restart: unless-stopped
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
      - prometheus-storage:/prometheus
    networks:
      - shared

volumes:
  grafana-storage: {}
  prometheus-storage: {}

networks:
  shared:
    name: grafana_network
    ipam:
      config:
        - subnet: 172.16.1.0/24
```

3. Start the containers:
```bash
docker-compose up -d
```

This Docker Compose setup deploys Grafana and Prometheus in Docker containers.

- **Grafana** can be accessed at: [http://<your-ip>:3000](http://<your-ip>:3000)
- **Prometheus** can be accessed at: [http://<your-ip>:9090](http://<your-ip>:9090)


### 6. Import dashboard and Use Grafana
After Grafana is up and running, you need to configure it through its web interface:

1. **Access Grafana**: Navigate to [http://<your-ip>:3000](http://<your-ip>:3000).
2. **Add Data Source**:
   - Click on **Connections** > **Data Sources**.
   - Choose **Prometheus** as the data source type.
   - Add the Prometheus server URL: `http://<your-ip>:9090`.
   - Click **Save & Test**.
3. **Import Dashboard**:
   - Go to **Dashboards** > **New Dashboard**.
   - Click on **Import Dashboard**.
   - In the Grafana dashboard ID field, enter the dashboard ID : `22081`
   - If you're having trouble importing with ID, please upload the dashboard JSON file: [Grafana JSON file](https://raw.githubusercontent.com/DeSpread/story-validator-monitoring/refs/heads/main/story-dashboard-by-despread.json).

Now you should have the Story Validator dashboard up and running!

---
If you have any questions or issues, feel free to reach out or refer to the [Official Grafana documentation](https://grafana.com/docs/).