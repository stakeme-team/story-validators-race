![Story Protocol Github Banner](https://github.com/user-attachments/assets/51fe2eef-9e7d-4550-9b85-870c4e98117c)

# Story Node Dashboard

## Overview

Story Node Dashboard is a Bash script that provides a user-friendly interface for managing and monitoring Story nodes. This tool simplifies the process of installing, upgrading, and maintaining Story nodes, making it easier for both novice and experienced users to participate in the Story network.

![CleanShot 2024-10-20 at 04 21 04](https://github.com/user-attachments/assets/7a2da6d7-b4c4-4f80-be42-dee8b7978aeb)

## Features

- Easy installation of Story Node
- Log checking for Story and Story-Geth
- Sync status monitoring
- Upgrade scheduling and instant upgrades
- Version checking for Story and Story-Geth
- User-friendly command-line interface

## Installation

1. Download the script and make it executable:

```bash
cd $HOME
wget https://gist.githubusercontent.com/botxx15/36f51945f2f92e666afeb15ec7a97f95/raw/story.sh
chmod +x story.sh
```

2. Run the script:

```bash
./story.sh
```

## Usage

After running the script, you'll be presented with a main menu offering the following options:

1. Install Story Node
2. Check Logs
3. Check Sync Status
4. Upgrade
5. Check Version
6. Quit

Navigate through the menu by entering the corresponding number for each option.

### Installing Story Node

Select option 1 from the main menu. You'll be prompted to enter a node moniker. The script will then:

- Install required packages
- Set up Go
- Download and install Story-Geth and Story binaries
- Configure Cosmovisor
- Set up systemd services

### Checking Logs

Select option 2 to view logs for either Story or Story-Geth services.

### Monitoring Sync Status

Select option 3 to check the current sync status of your node compared to the network height.

### Upgrading

Select option 4 to access the upgrade menu, where you can:

- Schedule a Story Client Upgrade
- Perform an Instant Upgrade

### Checking Versions

Select option 5 to check the current versions of Story and Story-Geth.

## Support

For more information and support, visit:

- Website: [https://blockhub.super.site](https://blockhub.super.site)
- GitHub: [https://github.com/BlockchainsHub](https://github.com/BlockchainsHub)
- Twitter: [https://x.com/blockchainshub](https://x.com/blockchainshub)
