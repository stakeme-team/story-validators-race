## Script to download and extract Pruned or Archive Snapshot
This script enables you to download and extract runed or Archive Snapshot with options to select either pruned or archive snapshot.

## How to execute the command
Just copy the following one liner paste it on Ubuntu 22.04 OS and press Enter to run the command:

```
source <(curl -s https://raw.githubusercontent.com/SynergyNodes/story_testnet/refs/heads/main/story-snapshot.sh)
```

## Overview of the Scritp

1. The user will be given option to select either pruned or archive node to download.
2. Based on the selection, the following process will be executed.
   * Stop ``story-geth`` and ``story`` nodes.
   * Backup ``~/.story/story/data/priv_validator_state.json`` file.
   * Download both Sotry and Story-Geth data - Pruned or Archive node based on the User selection.
   * Extract and replace data folder for Story and chaindata folder for Story-Geth.
   * Start ``story-geth`` and ``story`` nodes.
