![Story Protocol DeSpread Banner](https://raw.githubusercontent.com/DeSpread/story-validator/refs/heads/main/story-validators-race/wave-2/despread.jpg)
# Automatic Installer for the Story Node by DeSpread

Welcome to the **Story Node Dashboard**, your all-in-one tool for effortlessly managing and monitoring your Story Node. With this automated installer and management dashboard, you can streamline node setup, check sync statuses, perform upgrades with ease, and even automate upgrades at specific block heights.

# Key Features

1. **Automated Story Node Installation**  
   Simplifies the entire setup process, including:
    - Installation of necessary system packages
    - Setting up Go environment
    - Installing both Story-Geth and Story binaries
    - Configuring **Cosmovisor** for automatic upgrades
    - Initializing the Iliad Network Node
    - Setting up systemd services for seamless background operation

2. **Log Monitoring**  
   Provides easy access to view and monitor logs for:
    - Story Node service
    - Story-Geth service

3. **Synchronization Status**  
   Get real-time insights into your node's sync status, including:
    - Current block height of your node
    - Current block height of the network
    - Number of blocks left to fully synchronize

4. **Seamless Upgrades**  
   Choose between two upgrade options to keep your node up-to-date:
    - **Scheduled Upgrade**: Download and extract the latest client and schedule the upgrade for a specific block height using Cosmovisor.
    - **Instant Upgrade**: Apply the latest client upgrade immediately, ideal for urgent updates.

5. **Version Check**  
   Quickly check the version details of:
    - Story client
    - Story-Geth client

6. **Automated Node Monitoring and Upgrade**  
   Automatically monitor your node's block height and trigger an upgrade when a specified block height is reached. This feature allows you to:
    - Set a target block height.
    - Automatically check the node’s current block height.
    - If the block height matches or exceeds the target, the upgrade is triggered.
    - Prevents redundant upgrades by checking if the upgrade has already been applied.

# Prerequisites

- Ubuntu 20.04 or later
- Sudo privileges for executing system-level changes

# Installation and Usage Guide

## 1. Download the Installer

Use the following command to download the automatic installer script:
   ```bash
   curl -o story.sh https://raw.githubusercontent.com/DeSpread/story-validator/refs/heads/main/story-validators-race/wave-2/story-automatic-installer.sh
   ```

## 2. Make the Script Executable

Before running the script, give it executable permissions:
   ```bash
   chmod +x story.sh
   ```

## 3. Run the Installer

Launch the Story Node Dashboard by executing:
   ```bash
   ./story.sh
   ```

## 4. Navigate the Dashboard

- The installer will guide you through various options via a user-friendly menu.
- Simply enter the number corresponding to the desired action and follow the on-screen prompts.

# Detailed Menu Options

1. **Install Story Node**: Automates the complete installation and setup of the Story Node.
2. **View Logs**: Choose between viewing logs for either the Story service or the Story-Geth service.
3. **Check Sync Status**: Monitor real-time synchronization progress.
4. **Upgrade Story Client**: Opt for either a scheduled or immediate upgrade.
5. **Check Versions**: View the current version of the Story and Story-Geth clients.
6. **Automated Upgrade Based on Block Height**:
    - **Monitor Node**: Constantly checks the block height of your node.
    - **Automatic Upgrade**: When the node reaches a predetermined block height, it automatically upgrades using the predefined upgrade link and version.

# Automated Node Monitoring and Upgrade Instructions

## How It Works:

The monitoring feature constantly tracks your node’s current block height and compares it with a specified target height. When the node reaches or exceeds the target height, an automatic upgrade will be performed using `cosmovisor`. The system ensures that upgrades are not performed redundantly by checking if an upgrade has already been completed at that block height.

# Important Considerations

- **System Modifications**: This installer will make changes to your system configuration. Please review these changes before proceeding.
- **Log and Sync Checks**: To return to the main menu while checking logs or sync status, you may need to interrupt the process with `Ctrl+C`.
- **Upgrades**: When scheduling a client upgrade, ensure you have the correct upgrade link, version, and the designated block height to avoid misconfigurations.
- **Automated Upgrades**: Ensure the correct block height and upgrade parameters are configured for the automatic upgrade feature to work as intended.
