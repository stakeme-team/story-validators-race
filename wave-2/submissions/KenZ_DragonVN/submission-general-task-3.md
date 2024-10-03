## KenZ|DragonVN submit task 3: Provide Grafana dashboard

I have created a stake to help quick setup grafana + prometheus + influxdb to monitoring validator and geth .
Demo link ( use user `dev` and password `123456` for login ) : 

Geth dashboard : http://story-grafana.kzvn.xyz:3000/d/QC1Arp5Wk/geth-dashboard?orgId=1
![Screenshot 2024-10-02 at 17 29 01](https://github.com/user-attachments/assets/4c34a8ba-e0f2-4caf-b3c7-472d05ebcd0d)

Validator Dashboard : http://story-grafana.kzvn.xyz:3000/d/validator-network-dashboard/validator-network-dashboard-prometheus?orgId=1
![Screenshot 2024-10-02 at 17 29 54](https://github.com/user-attachments/assets/9eacb18c-ce33-42dc-ba05-5647fdbfec22)

##Step for setup : 


1. Setup grafana + prometheus + influxdb : 
 - Clone the repo : 
  ```bash
  cd && git clone git://github.com/quangtuyen88/story-monitoring.git
  ```
- Update env and start stack : 
 ```bash
  cd  story-monitoring/prometheus && cp -r .env.example .env
  ```
 You can change grafana and influx user. After that start stack :
 ```
  docker compose up -d
 ```

2. Enable Geth Metrics : 
 - On Server running Geth edit command for running geth in systemd and add this command below ( Remember change user and password to correct user/pass you create at the step 1 above ) : 
  ```bash
    --metrics --metrics.influxdb --metrics.influxdb.endpoint "http://0.0.0.0:8086" --metrics.influxdb.username "geth" --metrics.influxdb.password "your_password"
  ```
  Example : 
  ```bash
  /root/story/geth --iliad --syncmode full --metrics --metrics.influxdb --metrics.influxdb.endpoint "http://127.0.0.1:8086" --metrics.influxdb.username "geth" --metrics.influxdb.password "nimda321"
  ```
  - Restart geth service ( change service name you use for setup your geth node): 
  ```bash
  systemctl daemon-reload && systemctl restart geth
   journalctl -u geth -f -o cat
  ```
3. Enable metrics for Story Validator :  
   -  Edit file config in `$HOME/.story/story/config/config.toml`. Scroll down and update config below to enable prometheus metrics : 
   ```bash
    #######################################################
    ###       Instrumentation Configuration Options     ###
    #######################################################
    [instrumentation]

    # When true, Prometheus metrics are served under /metrics on
    # PrometheusListenAddr.
    # Check out the documentation for the list of available metrics.
    prometheus = true

    # Address to listen for Prometheus collector(s) connections
    prometheus_listen_addr = ":46760"

    # Maximum number of simultaneous connections.
    # If you want to accept a larger number than the default, make sure
    # you increase your OS limits.
    # 0 - unlimited.
    max_open_connections = 3

    # Instrumentation namespace
    namespace = "cometbft"
    ```
    you can change port `prometheus_listen_addr` to any port you want.

   - Restart service : 
    ```bash
    systemctl restart story && journalctl -u story -f -o cat
    ```
   - Verify that metrics endpoint is working : 
   ```
    curl localhost:46760
   ```
4. Update prometheus job : 
  - Edit file config prometheus at `$HOME/prometheus/prometheus/prometheus.yml` update `ip:port` to ip and port of the server you use for running story validator at step 3 :
  ```bash
   - job_name: story-validator
    static_configs:
    - targets:
      - ip:port
  ```
  - restart service : 
  ```bash
  cd $HOME/prometheus && docker compose down 
  docker compose up -d
  ```

5. Access grafana and import dashboard : 
 - Try accessing grafana dashboard use `ip:3000` and use user + password you set in `.env` .
 - Go to Home->dashboards on the right menu click on Import button and use json dashboard in the folder  `$HOME/prometheus/grafana/dashboards` to import
 - If you have issue with geth dashboard try go to Home->connections > datasources and click on `InfluxDB` and set password in `InfluxDB Details` and save and go back to dashboard.




I have write my own custom node exporter you can check step install at my github repo : https://github.com/quangtuyen88/story-exporter

![Screenshot 2024-10-03 at 21 03 57](https://github.com/user-attachments/assets/40e915c2-8fc9-482b-9671-92ef0fe3ed68)


After start node exporter you can edit config prometheus and add another job collect metric .

Example : 

```bash
- job_name: validator-exporter
  static_configs:
  - targets:
    - 10.10.10.39:8000
```
And import my dashboard at `$HOME/prometheus/grafana/dashboards` use file name `validator-custom-node-export.json`


