# General-task-1: StringLabs validator submission

This script enables you to set up a Story Node effortlessly with a single command. It automates the process of cloning the repository, setting permissions, and running the installation script.

## System Requirements

- **OS:** Ubuntu or Debian-based Linux
- **Memory:** 16GB RAM
- **Storage:** 200GB
- **CPU:** 4 Cores

## Installation

To install and run the Story Node in one command, execute:

```bash
wget https://raw.githubusercontent.com/slaranium/Story-Installer/main/story.sh && chmod +x story.sh && sudo ./story.sh

```
Note : enter moniker with your validator name

## Accessing Logs 

- **To view logs:** Use the command `sudo journalctl -u story-geth -f -o cat`and  `sudo journalctl -u story -f -o cat`.

- **To check sync status:** Execute `curl localhost:26657/status | jq` .
- **After your node sync, you can create your validator.

  ## Credits

This script was created by slaranium. You can also check out the [GitHub repository](https://github.com/slaranium/Story-Installer).
