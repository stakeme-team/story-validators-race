# Story Node Installation and Auto-Update Cosmovisor Script by Grand Valley

## Overview

This script is designed to automate the setup of a Story node and ensure seamless upgrades, focusing on the following key processes:

- Installation of necessary dependencies.
- Download and configuration of both the Geth and Consensus client binaries.
- Integration of `cosmovisor` for managing automatic upgrades.
- Configuring the node to auto-update at height 626575 to version `v0.10.0`.
- Reminding the user to update the node to version `v0.10.1` when the node reaches height 990454.

## How to Use the Script

### 1. **Run the Installation Script**

To install and configure your Story node, run the following command in your terminal:

```bash
bash <(curl -s https://raw.githubusercontent.com/hubofvalley/Testnet-Guides/main/Story%20Protocol/resources/node-install.sh)
```

### 2. **Provide Moniker and Port Number**

The script will prompt you to input your moniker (node name) and a preferred port number. Enter your desired values and proceed.

`Enter your moniker: <YOUR_MONIKER>
Enter your preferred port number: <YOUR_PORT_NUMBER>`

### 3. Node Initialization and Configuration

The script will automatically install all required dependencies, download the latest Story and Geth client binaries, and initialize the node. It will also configure persistent peers and set custom ports for your node.

### 4. Start and Enable Node Services

After completing the installation, the script will create systemd service files for both the Story and Geth clients and enable them:

```bash
sudo systemctl enable story-geth story
sudo systemctl restart story-geth story
```

You can check the status of the services using:

```bash
sudo systemctl status story-geth story
```

### 5. Automatic Node Upgrade

The node is configured to automatically upgrade to version `v0.10.0` at block height `626575`. After reaching this height, `cosmovisor` will handle the upgrade, ensuring that the node continues to run seamlessly.