# General Task 2: Service for providing archive & pruned snapshots

We have set up a service to provide both archive and pruned snapshots for the Story node. The service is hosted at [https://piki-nodes.xyz](https://piki-nodes.xyz), where you can find the latest snapshots with instructions for restoring them.

## Instructions for Pruned Snapshot
```bash
# Install dependencies, if needed
sudo apt install curl tmux jq lz4 unzip -y

# Stop node
sudo systemctl stop story story-geth

# Backup priv_validator_state.json
cp $HOME/.story/story/data/priv_validator_state.json $HOME/.story/story/priv_validator_state.json.backup

# Remove old data and unpack Pruned Story snapshot
# Note: Pleae check the site https://piki-nodes.xyz fro any latest snaphot 
rm -rf $HOME/.story/story/data
curl https://piki-nodes.xyz/download/pruned-snapshot--20241012055849.tar.lz4 | lz4 -dc - | tar -xf - -C $HOME/.story/story

# Restore priv_validator_state.json
mv $HOME/.story/story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json

# Restart node and check logs
sudo systemctl restart story story-geth
sudo journalctl -u story-geth -u story -f
