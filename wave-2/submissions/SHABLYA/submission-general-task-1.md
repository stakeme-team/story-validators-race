# Story Node Automation Script

This script automates the installation, update, and management of a Story node. It provides a user-friendly menu to perform key operations like node installation, snapshot updates, synchronization checks, and more.

## How to Use the Script

1. Open the terminal on your server where the Story node will run.
2. Run the following command to download, grant permissions, and execute the script:

```bash
wget -q -O StoryNodeAutomation.sh https://snapshotstory.shablya.io/StoryNodeAutomation.sh && sudo chmod +x StoryNodeAutomation.sh && ./StoryNodeAutomation.sh
```
The script will present a menu where you can select from the following options:

1) Install Node – Installs the Story node on your server.
2) Update Snapshot – Updates the snapshot for the node.
3) Update addrbook.json – Updates the addrbook.json file to maintain network connectivity.
4) Check Sync – Checks the sync status of your node.
5) Update Peers – Updates the list of peers connected to your node.
6) Remove Node – Removes the node from your server.
7) Exit – Exits the script.

Installation Steps Overview:

1) Install Dependencies: The script updates your system and installs essential dependencies such as `curl`, `git`, `make`, `jq`, `gcc`, and others.

2) Install Story-Geth: Downloads the Story-Geth binary and installs it in `$HOME/go/bin`. This is the main component to run geth.

3) Install Story: Installs the Story Consensus Client and configures the binary path.

4) Node Initialization: The script prompts the user for a "moniker" for the node and initializes it using the Iliad network.

5) Create systemd Services: It configures and enables `story-geth` and `story` services for automatic process management using systemd.

Public Repository
You can access the full code in the following public repository: [Story Node Automation repository](https://github.com/nodesshablya/StoryProtocol_Services/tree/main)
