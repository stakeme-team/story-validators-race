Grafana Dashboard for Story Validator
Here's an enhanced guide that includes steps for installing Grafana, Prometheus, and setting up the necessary exporters on your Story node.

Step-by-Step Instructions for Setting Up Grafana on Your Server
Step 1: Install Prometheus
Update your system and install necessary dependencies:

bash
Copy code
sudo apt update
sudo apt install wget curl -y
Download and Install Prometheus:

bash
Copy code
cd ~
wget https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-amd64.tar.gz
tar xvfz prometheus-*.tar.gz
cd prometheus-*
Start Prometheus:

bash
Copy code
./prometheus --config.file=prometheus.yml
Set up Prometheus as a service (optional but recommended for persistence):

Create a service file:
bash
Copy code
sudo nano /etc/systemd/system/prometheus.service
Add the following content to the file:
ini
Copy code
[Unit]
Description=Prometheus

[Service]
ExecStart=/home/your_username/prometheus-*/prometheus --config.file=/home/your_username/prometheus-*/prometheus.yml
Restart=always

[Install]
WantedBy=multi-user.target
Reload systemd and start Prometheus:
bash
Copy code
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
Verify that Prometheus is running by visiting: http://localhost:9090.

Step 2: Install Node Exporter (for system metrics)
Download and install the Node Exporter:

bash
Copy code
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
tar xvfz node_exporter-*.tar.gz
cd node_exporter-*
Start the Node Exporter:

bash
Copy code
./node_exporter
Set up Node Exporter as a service:

Create a service file for Node Exporter:
bash
Copy code
sudo nano /etc/systemd/system/node_exporter.service
Add the following content:
ini
Copy code
[Unit]
Description=Node Exporter

[Service]
ExecStart=/home/your_username/node_exporter-*/node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
Reload systemd and start Node Exporter:

bash
Copy code
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
Verify Node Exporter by visiting: http://localhost:9100/metrics.

Step 3: Install Grafana
Add the Grafana APT repository:

bash
Copy code
sudo apt-get install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo apt-get update
Install Grafana:

bash
Copy code
sudo apt-get install grafana
Start Grafana:

bash
Copy code
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
Access Grafana by going to http://your_server_ip:3000 in a browser.

Default credentials are:
Username: admin
Password: admin
Change the password upon first login.
Step 4: Configure Prometheus and Node Exporter in Grafana
Add Prometheus as a data source:

In Grafana, go to Configuration > Data Sources.
Click Add data source, choose Prometheus.
Enter http://localhost:9090 as the URL and save.
Create Dashboards for Node Metrics:

Use Grafana’s Import Dashboard feature and choose the Node Exporter Full dashboard from Grafana’s public dashboard library.
Step 5: Set Up Story Node Metrics Exporter (Optional)
If you need to monitor specific Story node metrics, you can write a custom exporter or add Story node's telemetry (if available) into Prometheus. You can create a script that collects validator-specific data such as:

Block height
Number of blocks signed
Validator uptime
Step 6: Import Your Custom Dashboard
Now that Grafana and Prometheus are set up:

Create a new dashboard in Grafana and add panels for:

Validator uptime
Block height
CPU, Memory, Disk usage from Node Exporter
Network traffic
Save your dashboard and export its JSON model by going to Settings (⚙️) > JSON Model.

Use the exported JSON model in your submission file.
