# Story Node Dashboard

Welcome to the Story Node Dashboard, a comprehensive tool for managing and monitoring your Story Node. This dashboard provides an easy-to-use interface for various node management tasks.

## Features

1. **Install Story Node**: Automates the process of setting up a Story Node, including:
   - Installing required packages
   - Setting up Go
   - Installing Story-Geth and Story binaries
   - Configuring Cosmovisor
   - Initializing the Iliad Network Node
   - Setting up systemd services

2. **Check Logs**: Allows you to view logs for:
   - Story service
   - Story-Geth service

3. **Check Sync Status**: Provides real-time information about your node's synchronization status, including:
   - Your node's current block height
   - The network's current block height
   - The number of blocks left to sync

4. **Schedule a Story Client Upgrade**: Facilitates upgrading your Story client by:
   - Downloading and extracting the new client
   - Scheduling the upgrade using Cosmovisor

5. **Check Version**: Allows you to check the version of:
   - Story client
   - Story-Geth client

## Prerequisites

- Ubuntu 20.04 or later
- Sudo privileges

## How to Use

1. Clone this repository:
   ```
   cd $HOME
   git clone https://gist.githubusercontent.com/botxx15/36f51945f2f92e666afeb15ec7a97f95/raw/story.sh
   ```

2. Make the script executable:
   ```
   chmod +x story.sh
   ```

3. Run the dashboard:
   ```
   $HOME/story.sh
   ```

4. Use the menu to navigate through different options:
   - Enter the number corresponding to the action you want to perform.
   - Follow the prompts for each action.

## Important Notes

- The installation process will modify your system configuration. Make sure you understand the changes before proceeding.
- Checking logs and sync status may require interrupting the process (Ctrl+C) to return to the main menu.
- When scheduling a client upgrade, make sure you have the correct upgrade link, version, and upgrade height.