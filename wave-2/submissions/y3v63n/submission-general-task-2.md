# Story Snapshot Download Manager
## 
## Overview
The Bash script uses `aria2` to dramatically reduce snapshot download time. At the time of writing, each Story consensus node and geth node pruned snapshots can be downloaded in about 10 mins. The script automates the extraction of snapshots, stopping services, backing up `priv_validator_state.json`, cleaning data directories, extracting the snapshots, and restarting the services. It aims to streamline the process of restoring your Story and Story Geth node data with minimal manual intervention. 

### Prerequisites
The script is designed for systems running Linux (tested with Debian/Ubuntu-based systems).

### Snapshot Suggestions
Just pick a snapshot from the following ones provided by some of the Story Network validators and input download URLs into respective fields.
- [Synergy Nodes](https://www.synergynodes.com/service/storytest)
- [Mandragora](https://hackmd.io/@bMLJfk-wRcus0zQNBavDTQ/r1Mc-eWhR#Apply-Mandragora-snapshots-story-clientstory-geth)
- [ITRocket](https://itrocket.net/services/testnet/story/)
- [Crouton Digital](https://crouton.digital/services/testnets/storyprotocol)
- [KJnodes](https://services.kjnodes.com/testnet/story/snapshot/)
- [f5nodes](https://wiki.f5nodes.com/story-protocol/sync/snapshot/)
- [Blacknodes](https://services.blacknodes.net/Story-Testnet/)
- [Shaurya Chopra](https://services.shachopra.com/story-testnet/snapshot)

### 
### Usage

```
wget https://raw.githubusercontent.com/y3v63n/StoryRace/refs/heads/main/wave2/task2/story_sdm.sh && chmod +x story_sdm.sh && ./story_sdm.sh
```

### Step-by-Step Functionality
#### 
#### 1. **Check and Install dependencies**
The script first checks if `aria2`, `curl` and `lz4` is installed. If it's not, it automatically installs them using apt-get.
#### 
#### 2. **User Input for Snapshot URLs**
The script prompts the user for two URLs:
- **Story Consensus Node Snapshot URL:**
- **Story Geth Node Snapshot URL**.

These URLs should point to compressed `.lz4` snapshot files.
#### 
#### 3. **Remove Existing aria2 Files**
Temporary `aria2` download files and any existing snapshots are deleted to ensure a clean working environment before new downloads begin.
#### 
#### 4. **Download Snapshots**
The script attempts to download snapshots using `aria2` with multiple connections for faster downloads. If this fails:
- It retries with a single connection.
- If both `aria2` attempts fail, it falls back to using `curl` for the download.

#### 
#### 5. **Stop Services**
The script stops both `story.service` and `story-geth.service` if they are currently running. This ensures that no conflicts occur during the extraction of new snapshot data.
#### 
#### 6. **Backup Critical Files**
The script backs up the `priv_validator_state.json`.
#### 
#### 7. **Clean Data Directories**
Old data in the Story and Story Geth directories is removed to prepare for new snapshot extraction. This prevents conflicts and ensures a clean state for the restored data.
#### 
#### 8. **Extract Snapshots**
The downloaded `.lz4` snapshots are extracted into the appropriate directories:
- **Story Snapshot** is extracted into the `$HOME/.story/story directory`.
- **Story Geth Snapshot** is extracted into the `$HOME/.story/geth directory`.

#### 
#### 9. **Restore Critical Files**
The backed-up `priv_validator_state.json` file is restored to its original location after the extraction, ensuring that the node's validator state remains intact.
#### 
#### 10. **Restart Services**
Once the extraction and restoration processes are complete, the script restarts both `story.service` and `story-geth.service`.
### 
###
