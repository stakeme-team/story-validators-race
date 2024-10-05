# Story Node Snapshot Installation Guide

This guide will walk you through the process of setting up or updating a Story node using snapshots provided by Coha05.

## Snapshot Information

- **Latest Snapshot**: [Current Block Height](https://snapshot.tech-coha05.xyz/block_height.txt)
- Snapshots are automatically updated every 12 hours

## Installation Steps

### 1. Install Required Tools

```bash
sudo apt-get install wget lz4 aria2 pv -y
```

### 2. Stop Node Services

```bash
sudo systemctl stop story
sudo systemctl stop story-geth
```

### 3. Download Snapshots

Download the Geth snapshot:
```bash
cd $HOME
aria2c -x 16 -s 16 https://snapshot.tech-coha05.xyz/Geth_snapshot.lz4
```

Download the Story snapshot:
```bash
cd $HOME
aria2c -x 16 -s 16 https://snapshot.tech-coha05.xyz/Story_snapshot.lz4
```

### 4. Backup Validator State

```bash
mv $HOME/.story/story/data/priv_validator_state.json $HOME/.story/priv_validator_state.json.backup
```

### 5. Remove Old Data

```bash
rm -rf ~/.story/story/data
rm -rf ~/.story/geth/iliad/geth/chaindata
```

### 6. Extract Snapshots

Extract the Story snapshot:
```bash
sudo mkdir -p /root/.story/story/data
lz4 -d Story_snapshot.lz4 | pv | sudo tar xv -C /root/.story/story/
```

Extract the Geth snapshot:
```bash
sudo mkdir -p /root/.story/geth/iliad/geth/chaindata
lz4 -d Geth_snapshot.lz4 | pv | sudo tar xv -C /root/.story/geth/iliad/geth/
```

### 7. Restore Validator State

```bash
mv $HOME/.story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json
```

### 8. Restart Node Services

```bash
sudo systemctl start story
sudo systemctl start story-geth
```

### 9. Clean Up

Remove the downloaded snapshot files:
```bash
sudo rm -rf Story_snapshot.lz4
sudo rm -rf Geth_snapshot.lz4
```

## Additional Information

For more details and updates, visit the [Coha05 Services website](https://services.tech-coha05.xyz/networks/story/snapshot.html).

## Troubleshooting

If you encounter any issues during the installation:

1. Ensure all required tools are correctly installed.
2. Check that you have sufficient disk space for the snapshots.
3. Verify that your system meets the minimum requirements for running a Story node.
4. If problems persist, seek help in the official Story Protocol community channels.

## Security Considerations

- Always back up your validator keys and state before performing any major operations.
- Ensure your server is secure and up-to-date with the latest security patches.
- Use trusted sources for snapshots to avoid potential security risks.

Remember to regularly check for updates to the Story node software and apply them as needed to keep your node in sync with the network.