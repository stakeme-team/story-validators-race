# Story Node Manager Script by CrdPool

A Bash script to automate the installation, management, and maintenance of a Story node. This script provides a menu-driven interface for easy node setup, snapshot updates, validator creation, and log viewing.

## Features
- **Install Story Node:** Automatically sets up dependencies, binaries, and configuration files for the Story node.
- **Install Snapshot:** Speeds up node synchronization by downloading and applying the latest snapshot.
- **Create Validator:** Sets up a validator on the Story network.
- **Update Node:** Updates both `story` and `story-geth` to their latest versions.
- **Delete Node:** Removes the node's services, binaries, and configuration files.
- **View Logs:** Displays real-time logs for `story` and `story-geth` services.

## Usage

Simply execute the commande bellow in your Ubuntu terminal:

```
wget https://raw.githubusercontent.com/crdpool/Story-Node-Manager/refs/heads/main/story_node_manager.sh && chmod +x story_node_manager.sh && bash -i story_node_manager.sh
```

## Hardware Requiremets
- CPU: 4 Cores
- RAM: 16GB
- Disk: 500GB
- Bandwith: 25 MBit/s

## Repository Link

https://raw.githubusercontent.com/crdpool/Story-Node-Manager/main/story_node_manager.sh

