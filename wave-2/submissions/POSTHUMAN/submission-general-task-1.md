
# Story Node Setup Script by PostHuman Validator 

https://github.com/Validator-POSTHUMAN/story-oneliner

This script is provided by PostHuman Validator to automate the setup and management of Story nodes on the Iliad network. It allows you to install, configure, and maintain Story nodes easily, ensuring a streamlined and efficient setup process.

To get started, use the following command to download, make the script executable, and run it:

```bash
curl -o story-manager.sh https://raw.githubusercontent.com/Validator-POSTHUMAN/story-oneliner/main/story-manager.sh && chmod +x story-manager.sh && ./story-manager.sh
```

## Features

The Story Node Setup Script offers a variety of features that help you set up and manage your Story node efficiently. Below is a breakdown of what each menu item can do:

### 1. Install Node (Full Setup)
- Checks your system's requirements (CPU, RAM, and disk space) to ensure compatibility.
- Installs necessary dependencies like Go and other libraries.
- Downloads and installs Story and Geth binaries.
- Initializes the node on the Iliad network.
- Configures the node with default settings, seeds, and peers.
- Sets up systemd services to run Story and Geth as background services.

### 2. Install Snapshot for Faster Sync
- Provides options to install a "Pruned" or "Archive" snapshot to speed up the initial synchronization of your node.
- Downloads and extracts the selected snapshot.
- Automatically backs up the `priv_validator_state.json` file and restores it after extracting the snapshot.
- Restarts the services to resume node operation.

### 3. Update Node
- Downloads and installs the latest Story and Geth binaries.
- Restarts the node services to apply the updates.

### 4. Create Validator
- Helps you set up a new validator by initializing the node with a unique moniker.
- Exports your validator and EVM keys for use in wallet applications (e.g., MetaMask or Phantom).
- Ensures that the node is fully synchronized before proceeding with validator creation.

### 5. Validator Operations
- **View Validator Info**: Shows information about your validator, including the public key.
- **Delegate**: Allows you to stake a specified amount to your validator.
- **Unstake**: Enables you to remove a specified amount from your staked tokens.
- **Manage Operators**: Adds or removes operator addresses authorized to manage the validator.
- **Set Withdrawal Address**: Sets the address where rewards will be withdrawn.

### 6. Node Operations
- **Node Info**: Displays the current status and information about the node.
- **Your Node Peer**: Shows your node's peer connection details.
- **Your Enode**: Retrieves the enode information for your Geth client.
- **Configure Firewall Rules**: Sets up the necessary firewall rules for network traffic.

### 7. Service Operations
- **Check Logs**: Allows you to view real-time logs for both Story and Geth services.
- **Start Service**: Starts the Story and Geth services.
- **Stop Service**: Stops the services.
- **Restart Service**: Restarts the services.
- **Check Service Status**: Displays the status of the services.
- **Reload Services**: Reloads the systemd configuration for services.
- **Enable Service**: Configures the services to start on boot.
- **Disable Service**: Prevents the services from starting on boot.

### 8. Geth Operations
- **Check Latest Block**: Retrieves the latest block number in the Geth client.
- **Check Peers**: Lists the peers connected to your Geth client.
- **Check Sync Status**: Displays the current synchronization status of the Geth client.
- **Check Gas Price**: Shows the current gas price.
- **Check Account Balance**: Allows you to view the balance of a specified Ethereum address.

### 9. Delete Node
- Deletes the node's data and configuration, including Story and Geth binaries.
- Prompts you for confirmation before proceeding to ensure the deletion is intentional.

### 10. Check System Requirements
- Verifies that your system meets the minimum requirements for running a Story node (CPU, RAM, and disk space).

### 11. View Logs
- Displays logs for either the Story or Geth services, allowing you to monitor node activity.

### 12. Check Sync Status
- Shows the synchronization status of both the Story and Geth services.
