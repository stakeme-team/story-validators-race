
# Guide on Using the Story Protocol Node Installation Script

This document will guide you on how to use the automated installation script for setting up a Story Protocol node. The script simplifies the process of downloading, configuring, and managing the Story Protocol and Story-Geth clients. It includes system checks, error handling, and an intuitive menu for managing the node.

## How to Use the Script

### 1. Run the Script with curl
To run the script directly, use the following command in your terminal:
```bash
bash <(curl -s https://raw.githubusercontent.com/sicmundu/story-wizzard/main/story-wizzard.sh)
```

### 2. Follow the Menu
Once the script starts, it will display a dynamic menu that adapts to the state of the node:
- If the node is not installed, you will be prompted to install it.
- If the node is already installed, you will see options to start, stop, and manage the node.

### 3. Managing the Node
After installation, you can manage your node by selecting options from the menu:
- **Start Node**: Starts the Story Protocol and Story-Geth services.
- **Stop Node**: Stops the services.
- **View Logs**: Displays live logs of Story-Geth.
- **Check Node Status**: Shows the current synchronization status of the node.

### 4. Logging
All actions and errors are logged into a log file located at:
```bash
$HOME/story_protocol_install.log
```

## Public Repository
The script is publicly available at the following GitHub repository:

[Story Protocol Installation Wizard](https://github.com/sicmundu/story-wizzard)

Clone the repository and follow the instructions to set up your node easily!

