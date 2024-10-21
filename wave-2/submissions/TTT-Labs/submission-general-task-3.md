![Story-validator](https://github.com/user-attachments/assets/deaacab6-a4e1-43d3-9ebd-2be8034f3835)

# **Setting up the Validator Monitoring Dashboard with Grafana, Prometheus, and Story Exporter**

## I. Overview: Why this Dashboard Matters for Validator Operations

The validator monitoring dashboard is a critical tool for operators to ensure their **Story node validator** is performing optimally. It offers real-time insights and metrics, including **system performance** (CPU, memory, disk, and network), **block production and consensus participation** from Tendermint-based metrics, and **custom Story metrics** gathered via Story-exporter. This dashboard helps with:

-   **Tracking validator uptime** and detecting missed blocks.
-   **Monitoring system health** through Node Exporter.
-   **Alerting on network performance issues** and Tendermint consensus health.
-   **Visualizing critical metrics** for validators with easy-to-understand graphs and alerts.

This guide walks you through **setting up all necessary components**, including **Story-exporter**, **enabling Prometheus metrics for Tendermint nodes**, **installing Node Exporter**, and **integrating everything in Prometheus**. Finally, it shows you how to **import our custom Grafana dashboard** for full monitoring capabilities.

### Access the Live Grafana Dashboard

Click the link below to experience the live version of our custom Grafana dashboard and explore the monitoring features in real-time:

🌿➡️ **[Live Grafana Dashboard](https://monitoring.tienthuattoan.com/public-dashboards/e9dd9ccd9efa41cf9817e9b716737a46?orgId=1&refresh=5s)**

## II. Prerequisites
Before starting, ensure you have:

1.  **Root access** to the machine.
2.  **Story node validator** running.
3.  **Access to the internet** to install required packages.
4.  **Prometheus Alertmanager and Grafana binaries** installed.

## III. Install and Configure

### A. Download and Install Story-Exporter

1.  **Get Story-exporter file** :
    `curl -o story-exporter.py https://raw.githubusercontent.com/TTT-Labs/Story-Protocol-Tools/main/story-exporter.py`
2.  **Install dependencies**:
    ```
    sudo apt update && sudo apt install -y python3 python3-pip
    pip3 install prometheus_client requests python-dotenv
3.  Create a **systemd service file**:
	`sudo nano /etc/systemd/system/story-exporter.service`
   Add the following:
	```
	[Unit]
	Description=Story Exporter Service
	After=network.target
	
	[Service]
	# User and Group to run the service
	User=story
	Group=story
	
	# Directory where the script is located
	WorkingDirectory=/opt
	
	# Command to execute the Python script
	ExecStart=/usr/bin/python3 /opt/story-exporter/story-exporter.py
	
	# Restart policy: restart service on failure
	Restart=always
	RestartSec=5
	
	# Set environment variables from .env file
	EnvironmentFile=/opt/story-exporter/.env
	
	# Standard output and error log
	StandardOutput=journal
	StandardError=journal
	
	[Install]
	WantedBy=multi-user.targe`
    
4.  **Create a new user** and set permissions:
    ```
    sudo useradd --no-create-home --shell /bin/false story
    sudo chown -R story:story /path/to/story-exporter
  
 5.  **`.env` Configuration for Story Exporter**

		To properly configure your **Story Validator setup**, create a `.env` file using the command below:
	`vim .env` 

		Add the following variables:
		```
		NODE_OPERATOR=storyvaloper1ymsmqlx54g33msau9x98my03p9hd36djvkylqd
		RPC_ENDPOINT=https://story-testnet-rpc.tienthuattoan.com
		API_BASE_URL=https://api.testnet.storyscan.app
##### Explanation of Each Environment Variable:
```
		A.  ***`NODE_OPERATOR`***
		    -   **Purpose**: Identifies the unique operator address of the validator node you are managing.
		    -   **Example**: `storyvaloper1ymsmqlx54g33msau9x98my03p9hd36djvkylqd`
		    -   **Details**: This address belongs to your specific validator on the Story blockchain. It is crucial for tracking validator performance, missed blocks, and uptime. Make sure to replace it with your **validator's address**.
		B.  ***`RPC_ENDPOINT`***
		    -   **Purpose**: Connects the validator node to the **remote RPC endpoint** to gather blockchain data.
		    -   **Example**: `https://story-testnet-rpc.tienthuattoan.com`
		    -   **Details**: RPC (Remote Procedure Call) endpoints provide real-time blockchain information such as block height, transactions, and consensus participation. The RPC URL here connects your validator to the **Story testnet** for accurate metrics collection. Replace it with your relevant RPC endpoint if using a different environment (like mainnet).
		C.  ***`API_BASE_URL`*** 
		    -   **Purpose**: Points to the **block explorer’s API** to retrieve additional validator data.
		    -   **Example**: `https://api.testnet.storyscan.app`
		    -   **Details**: The API base URL allows your monitoring system to pull insights from **StoryScan**, the official block explorer for the Story network. It provides enhanced data, including validator ranking, uptime history, and performance statistics.
```
6.  **Enable and start Story-exporter**:
    ```
    sudo systemctl daemon-reload
    sudo systemctl enable story-exporter
    sudo systemctl start story-exporter` 
7.  **Test the Story-exporter endpoint**:
    `curl http://localhost:8888/metrics`
![task02- Story-exporter](https://github.com/user-attachments/assets/c2d4d6a0-c4a0-4ea0-a3d6-7d9b3b649639)


----------

### B. Download and Install Node Exporter

1.  Download the latest Node Exporter:
    ```
	curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
    tar -xvzf node_exporter-1.6.1.linux-amd64.tar.gz
    sudo mv node_exporter-1.6.1.linux-amd64/node_exporter /usr/local/bin/` 
2.  Create a **systemd service file**:
    `sudo nano /etc/systemd/system/node-exporter.service` 
    
    Add the following content:
    ```    
	[Unit]
    Description=Node Exporter
    Wants=network-online.target
    After=network-online.target
    
	[Service]
	User=node_exporter
	ExecStart=/usr/local/bin/node_exporter
	Restart=on-failure
	    
	[Install]
	WantedBy=default.target
3.  Create the **Node Exporter user**:
    `sudo useradd --no-create-home --shell /bin/false node_exporter` 
    
4.  **Enable and start the service**:
    ```
    sudo systemctl daemon-reload
    sudo systemctl enable node-exporter
    sudo systemctl start node-exporter` 
5.  **Verify Node Exporter is running**:
    `curl http://localhost:9100/metrics`
![task02-Node-exporter](https://github.com/user-attachments/assets/80a5d30c-ea52-419a-8545-8c4ea79f4642)



----------

### C. Enable Prometheus Metrics on Story Node Validator

1.  Open the **Tendermint configuration file**:
    
    `nano ~/.story/story/config/config.toml` 
    
2.  **Enable Prometheus metrics** in the `[instrumentation]` section:
    ```
    [instrumentation]
     prometheus = true` 
3.  **Restart the Story Node validator**:
    `sudo systemctl restart story.service` 
    
4.  **Verify the metrics endpoint**:
    `curl http://localhost:26660/metrics`
![task02-story-tendermint](https://github.com/user-attachments/assets/917ab6bb-8dd5-4401-82a7-805231d42db0)


----------
### D. Configure Prometheus
    
1.  **Add Prometheus configuration**:
    `sudo nano /etc/prometheus/prometheus.yml` 
    
    Add the following:
	```
    global:
      scrape_interval: 15s
      evaluation_interval: 15s
    
    scrape_configs:
      - job_name: 'node-exporter'
        static_configs:
          - targets: ['localhost:9100']
    
      - job_name: 'story-exporter'
        static_configs:
          - targets: ['localhost:9600']
    
      - job_name: 'story-validator'
        static_configs:
          - targets: ['localhost:26660']
2. **Restart Prometheus**:
`sudo systemctl restart prometheus`

### E. Verify Setup Exporter and Prometheus

1.  **Check Prometheus Targets**
    -   Open Prometheus UI at `http://localhost:9090` or `http://<Your Prometheus Server Ip>:port`
    -   Navigate to **Status > Targets**.
    -   Ensure all targets (Node Exporter, Story-exporter, Tendermint Validator) are **UP**.

![task02-prometheus-validate](https://github.com/user-attachments/assets/a8fa1f6e-a5ae-4a27-8b3b-d06dcb1c63cf)

----------

### F .Importing the `story-validator-dashboard.json` File into Grafana
1. **Access Grafana**:

-   Open your web browser and enter the Grafana URL.  
    Example:
    `http://<your-grafana-host>:3001` 
 - Log in with your credentials.


2.  **Prepare the JSON File**

-   Ensure that you have the JSON dashboard file ready for import:  
    [Download the `story-validator-dashboard.json` file](https://raw.githubusercontent.com/TTT-Labs/Story-Protocol-Tools/refs/heads/main/story-validator-dashboard.json)

3.  **Importing the Dashboard**
	3.1.  **Go to the  Dashboard Page:**
	    -   On the right-hand menu, click on the **"+" (new)** icon.
	    -   Select **"Import"** from the dropdown.
   ![task02-grafana-imports](https://github.com/user-attachments/assets/e933616c-9ad4-46c5-bd77-32586e2e6361)

	3.2.  **Upload the JSON File:**
		 -   On the **Import page**, you will see three options:
	- **Enter Dashboard ID** from Grafana.com.
	-   **Upload JSON file** from your computer.
	-  **Paste JSON code** directly into the input field.
    -   Choose **Upload JSON File** and select the `story-validator-dashboard.json` you downloaded.
    
	3.3.  **Select the Data Source:**
    -   If prompted, select **Prometheus** as the data source you have.
    -   If no data source is available, you can add one:
        1.  Navigate to **Configuration > Data Sources**.
        2.  Click **Add Data Source** and choose **Prometheus**.
        3.  Set the **URL** to:
            
            `http://<prometheus-server>:9090` 
            
        4.  Save the data source.
4.  **Complete the Import:**
    
    -   Click **Import** to finish.


5.  **Verify the Dashboard**

	-   Once the import is complete, you will see the new dashboard displayed on the screen.
	-   You can access it anytime by navigating to **Dashboards > Manage** and searching for the imported dashboard.
![task02-dashboard](https://github.com/user-attachments/assets/f308eaa8-409a-4044-9121-3a68cff12e97)

----------

### G. Setting Up the Alerting System for Story Validator Monitoring

In addition to configuring the Grafana dashboard, **we highly recommend setting up an alerting system** to monitor validator nodes and the underlying infrastructure. This system plays a crucial role in ensuring high availability and performance by tracking essential metrics and sending timely notifications.

#### Guide to Configuring Alerts

1.  **Configure Prometheus Alerting Rules:**
    -   Create or modify the alert rules within Prometheus to track key metrics such as:
        -   **CPU or memory consumption** that may impact performance.
        -   **Validator node synchronization lag** to detect potential miss block, slow block, downtime....
        -   **Node failures or service disruptions.**
    -   This our rule (saved in `alerts-rules.yml`):
        ```
		  - alert: BlackboxSlowProbe
		    expr: avg_over_time(probe_duration_seconds[1m]) > 1
		    for: 1m
		    labels:
		      severity: warning
		    annotations:
		      summary: Blackbox slow probe (instance {{ $labels.instance }})
		      description: "Blackbox probe took more than 1s to complete\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"

		  - alert: BlackboxProbeHttpFailure
		    expr: probe_http_status_code <= 199 OR probe_http_status_code >= 400
		    for: 0m
		    labels:
		      severity: critical
		    annotations:
		      summary: Blackbox probe HTTP failure (instance {{ $labels.instance }})
		      description: "HTTP status code is not 200-399\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"

		  - alert: BlackboxSslCertificateWillExpireSoon
		    expr: 0 <= round((last_over_time(probe_ssl_earliest_cert_expiry[10m]) - time()) / 86400, 0.1) < 3
		    for: 0m
		    labels:
		      severity: critical
		    annotations:
		      summary: Blackbox SSL certificate will expire soon (instance {{ $labels.instance }})
		      description: "SSL certificate expires in less than 3 days\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"

		  - alert: BlackboxProbeSlowHttp
		    expr: avg_over_time(probe_http_duration_seconds[1m]) > 1
		    for: 1m
		    labels:
		      severity: warning
		    annotations:
		      summary: Blackbox probe slow HTTP (instance {{ $labels.instance }})
		      description: "HTTP request took more than 1s\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"
		  - alert: HighMissedBlocks
		    expr: changes(cosmos_validator_watcher_solo_missed_blocks{chain_id="bartio-beacon-80084"}[1m]) > 0
		    for: 1m
		    labels:
		      severity: critical
		    annotations:
		      summary: "High number of missed blocks detected"
		      description: "Validator has missed more than 0 blocks in the last minute for chain Berachain Testnet V2"
		"alert-rules.yaml" 242L, 10753B                                                                                                                    242,52        Bot
		  - alert: BlackboxConfigurationReloadFailure
		    expr: blackbox_exporter_config_last_reload_successful != 1
		    for: 0m
		    labels:
		      severity: warning
		    annotations:
		      summary: Blackbox configuration reload failure (instance {{ $labels.instance }})
		      description: "Blackbox configuration reload failure\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"

		  - alert: BlackboxSlowProbe
		    expr: avg_over_time(probe_duration_seconds[1m]) > 1
		    for: 1m
		    labels:
		      severity: warning
		    annotations:
		      summary: Blackbox slow probe (instance {{ $labels.instance }})
		      description: "Blackbox probe took more than 1s to complete\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"

		  - alert: BlackboxProbeHttpFailure
		    expr: probe_http_status_code <= 199 OR probe_http_status_code >= 400
		    for: 0m
		    labels:
		      severity: critical
		    annotations:
		      summary: Blackbox probe HTTP failure (instance {{ $labels.instance }})
		      description: "HTTP status code is not 200-399\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"

		  - alert: BlackboxSslCertificateWillExpireSoon
		    expr: 0 <= round((last_over_time(probe_ssl_earliest_cert_expiry[10m]) - time()) / 86400, 0.1) < 3
		    for: 0m
		    labels:
		      severity: critical
		    annotations:
		      summary: Blackbox SSL certificate will expire soon (instance {{ $labels.instance }})
		      description: "SSL certificate expires in less than 3 days\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"

		  - alert: BlackboxProbeSlowHttp
		    expr: avg_over_time(probe_http_duration_seconds[1m]) > 1
		    for: 1m
		    labels:
		      severity: warning
		    annotations:
		      summary: Blackbox probe slow HTTP (instance {{ $labels.instance }})
		      description: "HTTP request took more than 1s\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"
		  - alert: HighMissedBlocks
		    expr: changes(cosmos_validator_watcher_solo_missed_blocks{chain_id="iliad-0"}[1m]) > 0
		    for: 1m

    -   Ensure this file is added to the Prometheus configuration under `rule_files`.
2.  **Integrate with Notification Channels:**
    -   Prometheus supports various notification methods through **Alertmanager**, such as:
        -   **Slack, Email, Webhooks**, or **PagerDuty**.
    -   Configure **Alertmanager** (e.g., `alertmanager.yml`) to route alerts to the appropriate teams:
        ```
        receivers:
		  - name: 'telegram-bot'
		    telegram_configs:
		    - bot_token: xxxxx: xxxxxxxxxxxxxx
		      api_url: https://api.telegram.org  
		      message: '{{ template "telegram.ttt.message" .}}'
		      chat_id: -<>
		      parse_mode: 'HTML'

        
3.  **Verify the Alert Configuration:**
    
    -   After configuring Prometheus and Alertmanager, **reload the services** to apply the changes.
    -   Use Prometheus UI to **check the status of alerts**:
        -   Navigate to **`Status > Rules`** on the Prometheus interface.
        -   Verify if the rules are correctly loaded and active.
5.  **Test the Alerting System:**
    
    -   Simulate a condition that triggers an alert (e.g., stress test a node to generate high CPU usage).
    -   Confirm that Prometheus detects the condition and that the notification is sent via the configured channel.
![task02- Alerts02](https://github.com/user-attachments/assets/801056b0-d7ed-4b20-822d-f4f1c3298865)
![task02 - Alerts01](https://github.com/user-attachments/assets/22b3fee6-fecf-4685-a241-fe5828983a9d)
![task02-Alerts03](https://github.com/user-attachments/assets/257211c1-52c0-4882-8510-234a7b1f6cd1)

By implementing this **alerting system alongside the dashboard**, you ensure rapid responses to incidents, minimizing downtime and maintaining high system availability. The synergy between **Prometheus monitoring, Alertmanager notifications, and Grafana visualization** provides a comprehensive monitoring solution to meet operational needs efficiently.


### Conclusion
The **Story Validator Dashboard** developed by the DevOps team at **TTT Labs** offers a powerful and essential tool for monitoring validator nodes and system performance in real-time. Through seamless integration with Prometheus metrics and custom-built Story Exporters, the dashboard provides deep insights into system health, node activity, and resource usage. This enables validator operators to detect issues early, maintain high uptime, and ensure efficient resource management.

The dashboard empowers users to:

-   **Monitor Validator Performance:** Track key metrics like block production, latency, and node synchronization.
-   **Optimize Resources:** Visualize CPU, memory, and disk usage with insights from Node Exporter.
-   **Proactive Alerts:** Use Prometheus to detect anomalies and trigger alerts before problems escalate.
-   **Ensure Compliance:** Stay aligned with performance benchmarks, improving the reliability and trustworthiness of the validator infrastructure.

With its intuitive interface, easy installation, and customization capabilities, the Story Validator Dashboard becomes an invaluable part of any operator’s toolkit. By leveraging the expertise of the DevOps team at TTT Labs, this dashboard ensures continuous improvement, offering a robust monitoring solution for both current needs and future scaling challenges.
