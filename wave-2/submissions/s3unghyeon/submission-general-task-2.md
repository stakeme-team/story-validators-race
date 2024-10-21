# Story Node Setup Guide

This guide explains how to use the script for setting up a Story node.

**Snapshot Links**:   
Snapshot Link : https://story-testnet.nodeinfra.com/snapshot/

## Downloading and Running the Script

You can download and run the script using the following command:

```bash
wget https://raw.githubusercontent.com/s3unghyeon/story_setup/main/snapshot.sh && chmod +x snapshot.sh && ./snapshot.sh
```

This command performs the following actions:
1. Downloads the script from GitHub.
2. Grants execution permissions to the script.
3. Runs the script.

## Script Functionality

This script automates the process of setting up a Story node. The main features are as follows:

1. **Snapshot Type Selection**: 
   - Prompts the user to choose between pruned or archive snapshots.

2. **Dependency Installation**:
   - Installs `wget` and `lz4`.

3. **Node Shutdown**:
   - Stops the story-geth and story nodes.

4. **Data Backup and Cleanup**:
   - Backs up the validator state.
   - Removes previous chain data.

5. **Snapshot Download and Application**:
   - Downloads geth and story snapshots of the selected type.
   - Extracts and applies the downloaded snapshots.

6. **Cleanup**:
   - Removes the downloaded snapshot files.

7. **State Restoration and Node Restart**:
   - Restores the backed-up validator state.
   - Restarts the story-geth and story nodes.

## Important Notes

- This script deletes existing data, so make sure to back up any important data separately before running it.
- The script requires sudo privileges to run.
- Depending on your network conditions, downloading the snapshots may take a considerable amount of time.

