---
description: updated every 12h.
---

# Snapshots

```
#install dependencies, if needed
sudo apt install curl tmux jq lz4 unzip aria2 -y

# stop node
sudo systemctl stop story story-geth

# backup priv_validator_state.json
cp $HOME/.story/story/data/priv_validator_state.json $HOME/.story/story/priv_validator_state.json.backup

# remove old data and unpack Story snapshot
rm -rf $HOME/.story/story/data
curl https://snapshots.coinhunterstr.com/story/snapshot_latest.tar.lz4 | lz4 -dc - | tar -xf - -C $HOME/.story/story

# restore priv_validator_state.json
mv $HOME/.story/story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json

# delete geth data and unpack Geth snapshot
rm -rf $HOME/.story/geth/iliad/geth/chaindata
curl https://snapshots.coinhunterstr.com/story-geth/snapshot_latest.tar.lz4 | lz4 -dc - | tar -xf - -C $HOME/.story/geth/iliad/geth

# restart node and check logs
sudo systemctl restart story story-geth
sudo journalctl -u story-geth -u story -f
```
