# Snapshot Restoration Guide - Empirex

### Latest Snapshot Info

- **[Block Height](http://story-snapshot.empirex.tech/status)**
- **Auto-update Interval**: Every 8 hours

## Step 1: Install Required Tools

You can install the required tools using one of the following methods:

1. **Single Command**: Run the following command to install all necessary tools in one line:

   ```bash
   source <(curl -s https://raw.githubusercontent.com/eempirex/story-chain/refs/heads/main/snapshot.sh)
   ```

2. **Manual Setup**: Alternatively, execute the following command to install the tools individually:
   ```bash
   sudo apt-get install wget lz4 aria2 pv -y
   ```

## Step 2: Stop Node Services

Before proceeding, stop the Story and Geth node services:

```bash
sudo systemctl stop story
sudo systemctl stop story-geth
```

## Step 3: Download Snapshots

### Download Geth Snapshot

```bash
cd $HOME
aria2c -x 16 -s 16 http://story-snapshot.empirex.tech/Geth_snapshot.lz4
```

### Download Story Snapshot

```bash
cd $HOME
aria2c -x 16 -s 16 http://story-snapshot.empirex.tech/Story_snapshot.lz4
```

## Step 4: Backup `priv_validator_state.json`

To safeguard important state data, back up the `priv_validator_state.json` file:

```bash
mv $HOME/.story/story/data/priv_validator_state.json $HOME/.story/priv_validator_state.json.backup
```

## Step 5: Remove Old Data

Prepare for restoring from new snapshots by deleting the old chain data:

```bash
rm -rf ~/.story/story/data
rm -rf ~/.story/geth/iliad/geth/chaindata
```

## Step 6: Extract Snapshots

### Extract Story Snapshot

```bash
sudo mkdir -p /root/.story/story/data
lz4 -d Story_snapshot.lz4 | pv | sudo tar xv -C /root/.story/story/
```

### Extract Geth Snapshot

```bash
sudo mkdir -p /root/.story/geth/iliad/geth/chaindata
lz4 -d Geth_snapshot.lz4 | pv | sudo tar xv -C /root/.story/geth/iliad/geth/
```

## Step 7: Restore `priv_validator_state.json`

Move the backup file back to its original location:

```bash
mv $HOME/.story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json
```

## Step 8: Restart Node Services

Now that the new data is in place, restart your node services:

```bash
sudo systemctl start story
sudo systemctl start story-geth
```

## Step 9: Clean Up Snapshot Files

To free up space, remove the snapshot files you downloaded:

```bash
sudo rm -rf Story_snapshot.lz4
sudo rm -rf Geth_snapshot.lz4
```
