# Submission-General-Task-1

## Automatic installer for the Story node

## Tool Installation Command

To install the necessary tools for managing your Story Protocol node, run the following command in your terminal:

```bash
cd $HOME && wget https://raw.githubusercontent.com/CryptoBureau01/Story-Node/main/setup.sh && chmod +x setup.sh && ./setup.sh
```

### Sources Repository:
[Story-Node-Tool Setup Script](https://github.com/CryptoBureau01/Story-Node/blob/main/setup.sh)


# Summary for Auto Script - Node Management

This script is designed to streamline and simplify node management operations for the Story Protocol. It offers a user-friendly, menu-driven interface that enables users to perform a wide range of tasks with minimal manual intervention. 

## Key Features:
- **Dependency Management**: Easily install and configure all necessary dependencies for the node.
- **Binary Setup**: Manage binaries, including installation and updates, ensuring that the node runs on the correct versions.
- **Node Operations**: Start, stop, refresh, and monitor the status of the node through simple commands.
- **Validator Key Management**: Set up and manage validator keys, including functions for key generation, backup, and recovery.
- **Staking and Balances**: Check balances, stake tokens, and interact with the network in a secure and efficient manner.
- **Backup and Recovery**: Provides options for backing up and restoring node data, ensuring that important information is always safeguarded.

The script is interactive and waits for user input to select the desired operation, making it accessible to both beginners and experienced users managing Story Protocol nodes. By automating key tasks, the script reduces the complexity of node management, allowing users to focus on higher-level tasks.



# Code Breakdown (Menu Function)

1. **node_management_menu()**:  
   - This is the primary function that displays a menu to the user.  
   - The menu has 20 different options for managing various aspects of the Story Protocol node.  
   - **Options List**: A list of available actions, like "Install Dependencies," "Story-Geth Binary Setup," "Node Status," etc., is presented to the user.  
   - The script waits for user input, validates the selection, and then calls the appropriate function corresponding to the chosen option.  

2. **Menu Options**:  
   - Each option is mapped to a specific function that performs a task. For example:

   1. **Install-Dependencies**: Installs required software packages and libraries for the node.  
   2. **Story-Geth Binary Setup**: Sets up the Story-Geth binary for Ethereum-like layer interaction.  
   3. **Story Binary Setup**: Configures the Story Protocol's main binary for node operation.  
   4. **Setup Moniker Name**: Assigns a unique name (moniker) for your node.  
   5. **Update-Peers**: Updates the node’s peer list for network synchronization.  
   6. **Update-Snapshot**: Syncs the node using the latest blockchain snapshot.  
   7. **Stop-Node**: Safely stops the node's processes.  
   8. **Start-Node**: Starts and activates the node on the network.  
   9. **Refresh-Node**: Restarts the node to apply updates without long downtime.  
   10. **Logs-Checker**: Displays the node's logs for monitoring and debugging.  
   11. **Node-Status**: Shows the current status and health of the node.  
   12. **Validator-Info**: Provides details about the node’s validator status.  
   13. **Private-Key Checker**: Verifies and shows the node’s private key.  
   14. **Balance-Checker**: Checks the node’s token balance.  
   15. **Stake-IP**: Stakes tokens for validator participation.  
   16. **UnStake-IP**: Unstakes tokens, removing them from the staking pool.  
   17. **Full-Backup**: Backs up the node’s data and configurations.  
   18. **Recovery-Backup**: Restores a previously created backup.  
   19. **Remove-Node**: Completely uninstalls the node setup.  
   20. **Exit**: Closes the script and exits the menu.

3. **Interactive Prompt**:  
   The `while true` loop keeps the script running until the user selects the "Exit" option (Option 20).  
   For each selection, the script displays relevant information and calls the corresponding function to perform the action.

4. **Error Handling**:  
   If an invalid option is chosen, the script prompts the user to enter a valid number (between 1 and 20).


# Conclusion
This Auto Script for Node Management on the Story Protocol has been created by CryptoBuroMaster. It is a comprehensive solution designed to simplify and enhance the node management experience. By providing a clear and organized interface, it allows users to efficiently manage their nodes with ease. Whether you are a newcomer or an experienced user, this script empowers you to handle node operations seamlessly, ensuring that you can focus on what truly matters in your blockchain journey.



### Sources Repository:
[Story-Node-Tool Setup Script](https://github.com/CryptoBureau01/Story-Node/blob/main/setup.sh)
