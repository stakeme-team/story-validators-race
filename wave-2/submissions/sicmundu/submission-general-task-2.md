# Submission: General Task 2

## Overview

This submission contains a script for downloading, restoring, and synchronizing blockchain snapshots. The script automates the process of managing the Geth and Story Protocol clients by providing features to download fresh archived snapshots, prune old data, and monitor snapshot freshness compared to the latest block in the blockchain. It also includes a distributed synchronization mechanism to update remote nodes, making it an ideal solution for validator setups with multiple nodes.

## Link to GitHub Repository

The complete guide for using the script and all associated files can be found in the GitHub repository:

[Story Snapshot Wizard Repository](https://github.com/sicmundu/story-wizzard/tree/main)

## Key Features

- **Automated Download of Fresh Snapshots**: The script automatically downloads the latest archived snapshot as well as pruned snapshots for efficient blockchain node restoration.
- **Block Freshness Monitoring**: Built-in functionality to compare the latest snapshot block against the current blockchain state and provide insights on how recent the snapshot is.
- **Parallel Download for Speed**: Uses `aria2` for parallel downloading of snapshots, significantly reducing download times.
- **Distributed Node Synchronization**: Synchronizes snapshots across remote nodes, simplifying distributed node maintenance.
- **Unique Visual Effects**: Uses `figlet` and `lolcat` to provide a visually appealing summary once the restoration process completes.

## How to Use the Script

### Prerequisites

- An Ubuntu-based system (tested on Ubuntu 20.04)
- Sudo privileges
- SSH access configured for remote nodes (if synchronizing with multiple nodes)

### Running the Script

1. **Download and Run the Script**
   ```bash
   wget https://raw.githubusercontent.com/sicmundu/story-wizzard/main/story-snapshot.sh
   chmod +x story-snapshot.sh
   ./story-snapshot.sh
   ```

   The script will guide you through the installation process, download fresh snapshots, restore data, and synchronize it across remote nodes if needed.

## Synchronization to Remote Nodes

The script includes the ability to synchronize downloaded snapshots with other nodes in your network. You will need to configure SSH access to each remote node. This feature ensures that your entire validator network is up-to-date and synced efficiently.

## Additional Information

- **Validator State Backup**: Before applying new snapshots, the script ensures a backup of the `priv_validator_state.json` file, minimizing the risk of losing validator data.
- **Service Control**: The script automatically stops and restarts the `story-geth` and `story` services during the restoration process to ensure consistency.
- **Performance Tracking**: `pv` is used to monitor the progress of snapshot extraction, providing real-time feedback.

## License

This project is licensed under the MIT License.
