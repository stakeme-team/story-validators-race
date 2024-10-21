# This dashboard contains basic network and validator parameters
![image](https://github.com/user-attachments/assets/55ed3a07-1595-4ba2-bf5c-74fcf364fe30)

download dashboard and import in grafana interface: https://github.com/team-cryptomolot/metadata/blob/main/forstorynetworkdashboard.json

is installed on a separate server:
# 1. Install Docker 
```
sudo apt -q update
sudo apt -qy install ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt -q update
sudo apt -qy install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo usermod -aG docker $USER
```

# 2. Clone the repo
```
cd ~
git clone https://github.com/nodejumper-org/monitoring-tool.git
```
# 3. Create configuration files from examples
```
cd monitoring-tool
cp prometheus/prometheus.yml.example prometheus/prometheus.yml
cp alertmanager/config.yml.example alertmanager/config.yml
```
# 4. Start containers
```
sudo docker compose up -d
Open in browser http://<your_server_ip>:3000
default user: admin
default password: admin
```
# 5. Add your servers with installed node_exporter or installed cosmos-based node with enabled prometheus port to file prometheus/prometheus.yml
```
  # example for servers with node_exporter installed
  - job_name: "my-servers"
    static_configs:
    - targets: ["172.0.0.1:9100"]
      labels:
        instance: "server1"
    - targets: ["172.0.0.2:9100"]
      labels:
        instance: "server2"
    
  # example for servers with node_exporter and cosmos-based node installed
  - job_name: "cosmos-validator-nodes"
    static_configs:
    - targets: ["192.0.0.1:9100","192.0.0.1:26660"]
      labels:
        instance: "validator1"
    - targets: ["192.0.0.2:9100","192.0.0.2:26660"]
      labels:
        instance: "validator2"
    - targets: ["192.0.0.3:9100","192.0.0.3:26660"]
      labels:
        instance: "validator3"
```
# Next, install the node exporter on the server with the validator:
```
bash <(curl https://raw.githubusercontent.com/nodejumper-org/monitoring-tool/main/utils/install_node_exporter.sh)
```


# How to update
```
cd monitoring-tool
sudo docker compose down
git pull
sudo docker compose pull
sudo docker compose up -d
```
# Telegram notifications
In order to enable telegram notifications, create your own bot and fill in the following fields in the file alertmanager/config.yml
```
chat_id=1111111                 # your telegram user id
bot_token=11111111:AAG_XXXXXXX  # your telegram bot token
```
