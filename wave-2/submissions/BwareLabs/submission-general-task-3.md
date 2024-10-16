Github link: https://github.com/Tudor1217/StoryTasks/tree/main/story_grafana

Instructions:

1. Replicate the structure in 'story_grafana' directory
2. Update prometheus-config.yaml file with your values
3. Open port 3000
4. Run 'docker compose up -d'
5. Open \<yourIP>:3000 in browser and log in with default credentials (admin, admin), which will prompt you to change the password.

You will have the following provisioned:

Dashboard Visualizations:

1. **Validator Uptime (Timeseries)**  
   - **Description**: This timeseries chart tracks validator uptime based on missed blocks and signed blocks within a specified time range. It calculates the uptime by comparing missed blocks to total blocks and displays it per chain.
   - **Data Source**: Prometheus
   - **Target Expression**: Prometheus queries to calculate missed and signed blocks percentages.

2. **Validator Uptime (Gauge)**  
   - **Description**: This gauge displays the validator's uptime percentage, with thresholds defining different color states. It uses data on missed blocks vs total blocks for the calculation.
   - **Data Source**: Prometheus
   - **Target Expression**: Uses a Prometheus expression to calculate uptime percentage based on missed and total blocks.

3. **Validator Voting Power (Gauge)**  
   - **Description**: This gauge shows the validator's voting power as a percentage of the total validator power. The color changes based on thresholds.
   - **Data Source**: Prometheus
   - **Target Expression**: The expression divides the individual validator's power by the total validator power.

4. **Validator Service Status (Timeseries)**  
   - **Description**: A timeseries chart monitoring the availability of the validator service. It shows the uptime of different validators based on their IP and chain.
   - **Data Source**: Prometheus
   - **Target Expression**: Queries the "up" metric to check if validators are operational.

5. **Story Validator Free Space (Timeseries)**  
   - **Description**: Tracks the available free disk space for the validator, converting it to gigabytes.
   - **Data Source**: Prometheus
   - **Target Expression**: Monitors available filesystem space on a specific device.

6. **Validator Missed Blocks Status (Timeseries)**  
   - **Description**: This visualization shows missed blocks per minute for each validator, highlighting any discrepancies in block signing.
   - **Data Source**: Prometheus
   - **Target Expression**: Uses the "increase" function to track how many blocks were missed in a specific time range.

7. **Story Validator Memory Usage (Timeseries)**  
   - **Description**: This timeseries chart monitors memory usage for the story validator, displaying it as a percentage over time.
   - **Data Source**: Prometheus
   - **Target Expression**: Computes memory usage based on free, cached, and buffer memory relative to total memory.

8. **Validator Sync Status (Timeseries)**  
   - **Description**: Shows the synchronization status of validators by tracking the increase in the latest block height over time.
   - **Data Source**: Prometheus
   - **Target Expression**: Increases the latest block height metric to track syncing.

9. **Story Validator CPU Usage (Timeseries)**  
   - **Description**: This chart displays CPU usage for the story validator, with percentage usage calculated based on idle time.
   - **Data Source**: Prometheus
   - **Target Expression**: Uses CPU idle time to calculate and display the CPU usage as a percentage.

10. **Validator Peer Status (Timeseries)**  
   - **Description**: Monitors the status of peers connected to the validator, showing the number of peers over time.
   - **Data Source**: Prometheus
   - **Target Expression**: Tracks connected peers to the validator using the "cometbft_p2p_peers" metric.

Alerts:

1. **Story Testnet Service Down**  
   - **Description**: This alert triggers when the Story Testnet service becomes unavailable. If the service is detected as down for more than one minute, notifications will be sent out. This is crucial for ensuring the validator is running smoothly and can respond to requests.

2. **Story Testnet Sync Stuck**  
   - **Description**: This alert notifies when the synchronization process of the Story Testnet validator is stuck. If there is no increase in the latest block height for a specified period, it indicates potential issues with the validator's ability to keep up with the blockchain. Immediate attention is required to resolve any syncing problems.

3. **Story Testnet Validator Uptime**  
   - **Description**: This alert monitors the uptime of the Story Testnet validator. It triggers if the uptime percentage drops below 95%. Maintaining a high uptime percentage is essential for the validator's reliability and overall network performance. 

4. **Story Validator Testnet Peer Status**  
   - **Description**: This alert checks the number of peers connected to the Story Validator Testnet. If the number of peers drops below five for an extended period, it indicates that the validator may not be communicating effectively with other nodes. This could affect network participation and validation activities.

