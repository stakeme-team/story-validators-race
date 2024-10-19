# StakeTake: Automated Installation and Management Script for the Story Node 🚀
## 🌟 Project Overview

**StakeTake** offers an automated **Bash script** designed to simplify the installation and management of a **Story node**. This script streamlines the setup process, handles dependencies, configures services, and provides essential management tools, ensuring that both beginners and experienced users can deploy and maintain their nodes with ease.

## 🔧 Features

Upon running the script, you'll be presented with a menu offering the following options:

1. **New Installation of Story Node**
2. **Install Snapshot**
3. **Perform State Sync**
4. **Download Latest addrbook.json**
5. **Check Node Synchronization Status**
6. **Create Validator**
7. **View Service Logs**
8. **Completely Remove Story Node**
9. **Exit**

## 📝 Usage Instructions

### 🔍 Prerequisites

- **Operating System:** Unix-based (e.g., Ubuntu)
- **Permissions:** Root access or sudo privileges
- **Internet Connection:** Required for downloading dependencies and binaries

### 🚀 Running the Script

To execute the script, run the following command in your server's terminal:

```bash
bash <(curl -s https://raw.githubusercontent.com/StakeTake/scriptcosmos/main/install_story_node.sh)
```
This command fetches the latest version of the script from GitHub and executes it.

## 📋 Menu Options Explained

After launching the script, you'll encounter an interactive menu. Below is a detailed explanation of each option:

### 1. New Installation of Story Node
- **Description:** Performs a fresh installation of the Story node from scratch.
- **Actions:**
  - Installs necessary dependencies.
  - Installs Go and Cosmovisor.
  - Downloads and installs the Story and Story-Geth binaries.
  - Initializes the node configuration.
  - Creates and configures systemd service files.
  - Starts and enables the Story services.
  - Downloads the latest `addrbook.json` to optimize peer connections.

### 2. Install Snapshot
- **Description:** Installs a snapshot to accelerate node synchronization.
- **Actions:**
  - Stops running Story services.
  - Backs up the `priv_validator_state.json` file.
  - Removes old node data.
  - Downloads and extracts both Geth and consensus snapshots.
  - Restores the `priv_validator_state.json` from the backup.
  - Downloads the latest `addrbook.json`.
  - Restarts the Story services and checks synchronization status.

### 3. Perform State Sync
- **Description:** Executes a state synchronization to reduce the time required for node synchronization.
- **Actions:**
  - Stops the Story service.
  - Backs up the `priv_validator_state.json` file.
  - Resets node data.
  - Configures state sync parameters in `config.toml`.
  - Restores the `priv_validator_state.json` from the backup.
  - Downloads the latest `addrbook.json`.
  - Restarts the Story service and monitors logs for synchronization progress.

### 4. Download Latest addrbook.json
- **Description:** Downloads and updates the `addrbook.json` file to enhance peer connectivity and synchronization efficiency.
- **Actions:**
  - Fetches the latest `addrbook.json` from the specified URL.
  - Replaces the existing `addrbook.json` in the node configuration.

### 5. Check Node Synchronization Status
- **Description:** Checks the current synchronization status of your Story node.
- **Actions:**
  - Retrieves synchronization information, including current block height, network's latest block, blocks remaining to catch up, and estimated time for full synchronization.

### 6. Create Validator
- **Description:** Guides you through the process of creating a new validator.
- **Actions:**
  - Exports the validator account and EVM keys.
  - Prompts you to request test tokens from the faucet.
  - Stakes the specified amount of tokens to create the validator.
  - Saves the `priv_validator_key.json` securely for future use.

### 7. View Service Logs
- **Description:** Allows real-time viewing of logs for both `story` and `story-geth` services.
- **Actions:**
  - Selects which service logs to display.
  - Streams the selected service logs using `journalctl` for monitoring and troubleshooting.

### 8. Completely Remove Story Node
- **Description:** Fully removes the Story node from your server, including all data and configurations.
- **Actions:**
  - Stops and disables Story services.
  - Removes service files and binaries.
  - Deletes node directories.
  - Optionally removes the Go installation based on user preference.

### 9. Exit
- **Description:** Exits the script menu and terminates the script execution.

## 📞 Support
If you encounter any issues or have questions regarding the script, please reach out to us through the following channels:

- **Email:** [support@stake-take.com](mailto:support@stake-take.com)
- **Twitter:** [@StakeAndTake](https://twitter.com/StakeAndTake)
- **Website:** [stake-take.com](https://stake-take.com)

## 🔄 Updates
The script is regularly updated to align with the latest developments in the Story network. It's recommended to check for updates before initiating a new installation to benefit from new features and improvements.

## ⚠️ Disclaimer
Use this script at your own risk. Ensure you understand each step and have backups of your data before making significant changes to your node's configuration.

## 📚 Additional Recommendations

To further enhance the script and user experience, consider implementing the following features:

### 🔄 Automated Updates
- **Add Functionality:**
  - Automatically update the script and node binaries to their latest versions.
  - Notify users when a new version is available and provide options to upgrade.

### 💾 Backup and Restore
- **Include Options:**
  - Backup node configurations and data before performing critical operations like snapshot installation or state sync.
  - Allow users to restore from backups in case of failures or unintended changes.

### 🔒 Enhanced Security
- **Implement:**
  - Integrity checks for downloaded binaries using checksums (e.g., SHA256) to ensure file authenticity.
  - Provide warnings and best practices for securing private keys and sensitive information.

### 📈 Advanced Monitoring
- **Integrate:**
  - More detailed health checks, such as monitoring peer connections, block processing times, and resource utilization.
  - Offer alerting mechanisms via email or messaging platforms for critical issues or when synchronization completes.

### 📖 Comprehensive Documentation
- **Develop:**
  - Detailed guides and FAQs addressing common issues and advanced configurations.
  - Troubleshooting steps for typical problems users might face.

### 🌐 Localization
- **Expand Support:**
  - Support for multiple languages to cater to a broader audience.
  - Ensure all user-facing messages and documentation are translated accurately.

---

Thank you for choosing **StakeTake** for your Story node deployment and management needs! 🚀
