# User Guide for Story Node Installation and Management Script
## 
## Overview
This Bash script automates the installation, configuration, and management of a Story node and its accompanying Story Geth client. The script provides options to download necessary dependencies, build the binaries, set up services, and manage the node lifecycle via a simple menu system. It also includes functions for snapshot downloads, status checking, and log viewing.
## 
## Features
- **Dependency Installation**: Automatically installs Go, Git, and other required tools.
- **Node Installation**: Downloads and builds the Story and Story-Geth binaries.
- **Service Setup**: Configures systemd services for Story and Story-Geth.
- **Snapshot Management**: Downloads and applies blockchain snapshots for fast synchronization.
- **Node Monitoring**: Provides the ability to check node status and view logs.
- **Service Control**: Start, stop, and restart Story and Geth services with ease.

## 
## Prerequisites
- Ubuntu-based system.
- Root or sudo access.

## To Run the Script

```
wget https://raw.githubusercontent.com/y3v63n/StoryRace/refs/heads/main/wave2/task1/story_nms.sh && chmod +x story_nms.sh && ./story_nms.sh
```

## Script Instructions
### Step 1: Install Dependencies
Run the script and select option `1` from the menu to install all necessary dependencies, including Go, Git, and other required packages.
### 
### Step 2: Install Story Node
Select option `2` from the menu to install the Story node. The script will:
- Prompt you to select a Story version and a Geth version.
- Download, build, and install the selected versions.
- Initialize the node with a moniker.
- Add seed nodes to ensure the node can communicate with the network.
- Download and extract the latest snapshot for faster synchronization. This part of the code is authored by [ITRocket](https://itrocket.net/api/testnet/story/autosnap/) and slightly modified by us.

### 
### Step 3: Setup Systemd Services
Select option `3` from the menu to create and start systemd services for both Story and Story-Geth. This step ensures that your node runs in the background and restarts automatically if the system reboots.
### 
### Step 4: Monitor Node Status
Select option `4` to check the status of the Story node. The script will display the current block height and whether the node is catching up to the network. It will compare your local node height to the latest block on two remote RPC nodes.
### 
### Step 5: View Logs
You can view real-time logs for both the Story Geth and Story services using options `5` and `6`. These logs provide insight into the node's operation and help troubleshoot issues.
### 
### Step `6`: Manage Services
Use options `7`, `8`, `9`, and `10` to stop, restart, or start the Story and Geth services.
### 
### Step 7: Remove Node
If you need to remove the node and all associated services, select option `11`. This will:
- Stop and disable the services.
- Remove the binaries and configuration files.
- Clean up all data from your system.

### 
### Step 8: Exit
Select option `12` to exit the script.
