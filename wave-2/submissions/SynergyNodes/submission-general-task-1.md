## Automatic installer for the Story node
This script enables you to quickly install and configure a Story node with a single click, using the latest Story and Story-Geth binaries.

## How to execute the command
Just copy the following one liner paste it on Ubuntu 22.04 OS and press Enter to run the command:

```
source <(curl -s https://raw.githubusercontent.com/SynergyNodes/story_testnet/refs/heads/main/story-testnet-installer.sh)
```

## Overview of the Scritp

1. Update and Upgrade on Ubuntu 22.04 with latest software and security patches. If needed, user will be asked to enter sudo password.
2. Install the necessary tools for the Story node to run.
3. Download and install Go version 1.23.1, and update environment variables.
4. Download the latest Story-Geth and Story binaries and move them to $HOME/go/bin folder.
5. Install the node, user will be asked to enter the Moniker Name.
6. Download and move Genesis, Addrbook files to story home folder.
7. Get latest live peers and add them to config.toml file present in story home folder.
8. Download and restore latest snapshot for both story-geth and story.
9. Create service files for both story-geth and story.
10. Enable the files and start the services.
11. Check the status for both the services.
12. Display last 100 lines of story-geth and story logs.
13. Check the sync status
