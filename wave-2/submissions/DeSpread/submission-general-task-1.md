![Story Protocol DeSpread Banner](https://raw.githubusercontent.com/DeSpread/story-validator/refs/heads/main/story-validators-race/wave-2/despread.jpg)
# Automatic Installer for the Story Node by DeSpread

Welcome to the **Story Node Dashboard**, your all-in-one tool for effortlessly managing and monitoring your Story Node. With this automated installer and management dashboard, you can streamline node setup, check sync statuses, and perform upgrades with ease.

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

# Important Considerations

- **System Modifications**: This installer will make changes to your system configuration. Please review these changes before proceeding.
- **Log and Sync Checks**: To return to the main menu while checking logs or sync status, you may need to interrupt the process with `Ctrl+C`.
- **Upgrades**: When scheduling a client upgrade, ensure you have the correct upgrade link, version, and the designated block height to avoid misconfigurations.
