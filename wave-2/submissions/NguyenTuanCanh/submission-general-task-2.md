# Story Snapshot Installation Guide

### Latest Snapshot Info

- **[Block Height](http://story-snapshot.xxxigm.xyz/info)**
- **Auto-update Interval**: Every 12 hours

## Option 1: Automated Installation with a Single Command

### Step 1: Run the following command to install and execute the script automatically:

```bash
source <(curl -s https://raw.githubusercontent.com/NguyenTuanCanh/story-protocol/refs/heads/main/snapshot)
```

### Step 2: The script will perform the following tasks automatically:

- Check and install `figlet` to display a custom banner.
- Check and install required packages: `wget`, `lz4`, `aria2`, and `pv`.
- Stop the `story` and `story-geth` services.
- Download and extract the Geth and Story snapshots.
- Backup and restore the `priv_validator_state.json` file.
- Restart the node services.

---

## Option 2: Manual Installation Step-by-Step

### Step 1: Check and Install Figlet (if not already installed)

Figlet is a tool to display text banners in ASCII format.

```bash
sudo apt-get update && sudo apt-get install -y figlet
```

### Step 2: Display a Custom Banner

```bash
figlet "Story Snapshot"
```

### Step 3: Check and Install Required Packages

The required packages are `wget`, `lz4`, `aria2`, and `pv`. You can install them using the following command:

```bash
sudo apt-get update
sudo apt-get install -y wget lz4 aria2 pv
```

### Step 4: Stop Running Node Services

Stop the `story` and `story-geth` services to prepare for the update:

```bash
sudo systemctl stop story
sudo systemctl stop story-geth
```

### Step 5: Download Geth and Story Snapshots

Use `aria2c` for fast download of snapshots from the server:

```bash
cd "$HOME"
aria2c -x 16 -s 16 http://story-snapshot.xxxigm.xyz/geth-snapshot.lz4
aria2c -x 16 -s 16 http://story-snapshot.xxxigm.xyz/story-snapshot.lz4
```

### Step 6: Backup the `priv_validator_state.json` File

Backup the file to avoid losing important validator data:

```bash
if [ -f "$HOME/.story/story/data/priv_validator_state.json" ]; then
    mv "$HOME/.story/story/data/priv_validator_state.json" "$HOME/.story/priv_validator_state.json.backup"
fi
```

### Step 7: Clean Old Data

Remove old data directories to prepare for the new snapshots:

```bash
rm -rf "$HOME/.story/story/data"
rm -rf "$HOME/.story/geth/iliad/geth/chaindata"
```

### Step 8: Extract the Snapshots

Extract the Story and Geth snapshots:

```bash
sudo mkdir -p /root/.story/story/data
lz4 -d story-snapshot.lz4 | pv | sudo tar xvf - -C /root/.story/story/

sudo mkdir -p /root/.story/geth/iliad/geth/chaindata
lz4 -d geth-snapshot.lz4 | pv | sudo tar xvf - -C /root/.story/geth/iliad/geth/
```

### Step 9: Restore the Backup of `priv_validator_state.json`

Restore the backup file if it exists:

```bash
if [ -f "$HOME/.story/priv_validator_state.json.backup" ]; then
    mv "$HOME/.story/priv_validator_state.json.backup" "$HOME/.story/story/data/priv_validator_state.json"
fi
```

### Step 10: Restart the Node Services

Restart the node services to complete the process:

```bash
sudo systemctl start story
sudo systemctl start story-geth
```

### Step 11: Clean Up the Snapshot Files

Remove the snapshot files after extraction to free up space:

```bash
rm -f story-snapshot.lz4
rm -f geth-snapshot.lz4
```

### Step 12: Confirm the Node Has Restarted Successfully

Your node has been updated and restarted successfully.
