# Story Automation script

This is an automation script that installs story and geth binaries and starts the new nodes, or just simplying upgrade the binaries without damaging the data.

## Overview
The script has 2 main functions: Install new node and upgrade the nodes. The script can be run in any OSs, and are fully autonomous without user's interactions. Here are the commands and their functions:

1. `install`: This command will install new `geth` and `story` binary with the given version, then initialize new home for both Story and Geth clients, and create 2 services. The node will start syncing from block 1, and the user can provide any mmoniker.
2. `upgrade-geth`: This command will upgrade `geth` node only by replacing old binary with the new version provided by user and not affect the node data
3. `upgrade-story`: This command has the same function as `upgrade-geth`, but for `story` node.

## Instructions

### Getting the script
To obtain the script, run the following command:
```bash
wget https://gist.githubusercontent.com/MasterPi-2124/a8a16f413fbdbcb9f12e81425bb254dd/raw/3f69475915137e83e902d2b4382538b31d00d29b/story.sh
```

### Installing new node
To run the script, just simply run this command: 
```bash
bash story.sh install <geth-version> <story-version> -m|--moniker <moniker>
```
The script will automatically check for required prerequisites like go version or other commands needed during the installation. Then, it will follows these below steps:
1. Clone into `story` repo and install the binary with provided version
1. Clone into `geth` repo and install the binary with provided version
1. Initialize the new node
1. Create 2 services for geth and story
1. Start the service

All versions and moniker must be provided so the command can be run normally.

### Upgrade Geth
To run the script, use this command:
```bash
bash story.sh upgrade-geth <geth-version>
```
The script will stop the geth service, apply new version and then restart the service.

### Upgrade Story
To run the script, use this command:
```bash
bash story.sh upgrade-story <story-version>
```

Similar to `upgrade-geth` command, this command also just apply the new version and restart the story service.