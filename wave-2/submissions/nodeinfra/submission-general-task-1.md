# Story Node Setup and Management Script

This submission provides a comprehensive script for Story node installation, upgrade, management, and status checking.

## Repository

The script is located in the following public repository:

[https://github.com/s3unghyeon/story_setup.git](https://github.com/s3unghyeon/story_setup.git)

## Features

The script offers the following main features:

1. **Install Story Node**: Sets up a new Story node with all necessary components.
2. **Upgrade Story Node**: Allows for upgrading the Story node to a new version.
3. **Check Current Version**: Displays the current version of the installed Story node.
4. **Check Node Status**: Allows checking the status of story-geth and story services.
5. **Logging**: All major operations are logged for easy troubleshooting.
6. **Error Handling**: Checks for successful execution of critical commands.
7. **Configuration Backup**: Creates a backup of the current configuration before upgrades.

## Usage Guide

To use the Story Node Setup and Management Script, you can download and run it with a single command:

```
wget https://raw.githubusercontent.com/s3unghyeon/story_setup/main/story_node_setup.sh && chmod +x story_node_setup.sh && ./story_node_setup.sh
```

This command will:
1. Download the script directly from the GitHub repository
2. Make the script executable
3. Run the script

After running this command, follow the on-screen menu to choose your desired action:
   - Option 1: Install a new Story Node
   - Option 2: Upgrade an existing Story Node
   - Option 3: Check the current Story Node version
   - Option 4: Check Node Status
   - Option 5: Exit the script

## Detailed Feature Explanation

### 1. Install Story Node
- Installs Go 1.22.0
- Downloads and installs Story Geth client (version 0.9.3)
- Downloads and installs Story binary (version 0.9.13)
- Installs Cosmovisor
- Initializes the Story node with a user-provided moniker
- Updates peer information
- Sets up systemd services for both Story Geth and Story node

### 2. Upgrade Story Node
- Prompts for the new Story binary download link and version
- Confirms the upgrade action with the user
- Creates a backup of the current configuration
- Downloads and extracts the new Story binary
- Uses Cosmovisor to schedule the upgrade

### 3. Check Current Version
- Displays the current version of the installed Story node
- Provides detailed error messages if version checking fails

### 4. Check Node Status
- Allows user to choose between checking story-geth or story service status
- Displays the most recent 10 lines of the selected service's log using journalctl

## Notes

- The script requires sudo privileges for certain operations.
- It will prompt you to enter a moniker for your node during installation.
- The script sets up the node to sync in full mode.
- Both Story Geth and Story node services are configured to start automatically after installation.
- A log file (`story_node_setup.log`) is created in the same directory as the script, recording all major operations.

## Error Handling

The script includes error checking for critical operations. If an error occurs, the script will log the error message and exit, preventing partial or incorrect installations/upgrades.
