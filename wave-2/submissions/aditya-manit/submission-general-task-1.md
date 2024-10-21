# One Liner
```bash
bash <(curl -s https://raw.githubusercontent.com/encapsulate-xyz/story-installer-tui/refs/heads/main/node_tui.sh)
```

This script generates a Terminal User Interface (TUI) that allows you to easily manage Story Protocol nodes and related activities, including installation, snapshots, binary updates, monitoring, and log management.

## Features Overview

| **Feature**                | **Description**                                                                                               |
|----------------------------|---------------------------------------------------------------------------------------------------------------|
| **Install Node**           | Installs dependencies, downloads Story and Geth binaries, and sets up systemd service files.                  |
| **Apply Blockchain Snapshot** | Downloads and extracts either **archival** or **pruned** snapshots for Story and Geth nodes.                  |
| **Update Binary**          | Updates Story or Geth binaries and restarts the respective services.                                          |
| **Check Node Status**      | Monitors synchronization by comparing block height with an RPC endpoint and displays the lag.                 |
| **View Logs**              | Displays real-time logs for Story or Geth nodes using `journalctl`.                                           |
| **Add Seed Nodes**         | Adds predefined seed nodes to the Story node configuration.                                                   |
| **Add Peer Nodes**         | Fetches peers from the RPC endpoint and adds them to the persistent peer list.                                |
| **Add Geth Enode**         | Adds a new Geth enode to the running node via IPC.                                                            |
| **Download Addrbook**      | Downloads the latest addrbook for the Story node from the provided URL.                                       |
| **Stop Services**          | Stops Story and Geth services.                                                                                |
| **Restart Services**       | Restarts Story and Geth services.                                                                             |


## Visual Overview

Here is a visual representation of the key menus and interfaces provided by the script:

### Main Menu
![Main Menu](https://raw.githubusercontent.com/encapsulate-xyz/story-installer-tui/refs/heads/main/images/main-menu.png)  
The main menu allows you to navigate through essential features such as node installation, snapshot management, binary updates, and monitoring tools.

### Snapshot Menu
![Snapshot Menu](https://raw.githubusercontent.com/encapsulate-xyz/story-installer-tui/refs/heads/main/images/snapshot-menu.png)  
This menu offers the choice between **archival** and **pruned** snapshots, helping you manage blockchain data size effectively.

### Monitor Node Status
![Monitor Node Status](https://raw.githubusercontent.com/encapsulate-xyz/story-installer-tui/refs/heads/main/images/monitor-node-status.png)  
Provides real-time insights into your node's block height compared to the RPC endpoint, showing any block lag.

### View Logs
![View Logs](https://raw.githubusercontent.com/encapsulate-xyz/story-installer-tui/refs/heads/main/images/view-logs.png)  
Choose between monitoring **Story** or **Geth** logs in real-time, allowing quick access to important information for debugging and maintenance.