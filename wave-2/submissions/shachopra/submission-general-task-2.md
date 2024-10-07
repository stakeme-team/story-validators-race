### Archival & Pruned Snapshot by shachopra
**- Website**: https://services.shachopra.com/story-testnet/snapshot

**- Archival Snapshot height**: [click here](https://story-snapshot.shachopra.com:8443/downloads/height.txt)

**- Pruned Snapshot height**: [click here](https://story-snapshot2.shachopra.com:8443/downloads/height.txt)

**- Archival & Pruned Snapshot will auto update every 8 hours & 5 hours respectively**


### 1. Install required tools
```
sudo apt-get install wget lz4 pv -y
```
### 2. Stop Story & Story-Geth Node
```
sudo systemctl stop story
sudo systemctl stop story-geth
```
### 3. Backup priv_validator_state.json
```
sudo cp $HOME/.story/story/data/priv_validator_state.json $HOME/.story/priv_validator_state.json.backup
```
### 4. Remove old data
```
sudo rm -rf $HOME/.story/story/data
sudo rm -rf $HOME/.story/geth/iliad/geth/chaindata
mkdir -p $HOME/.story/geth/iliad/geth
```
### 5a. Download Story-Geth & Story Archival Snapshot
```
cd $HOME
wget -O snapshot_story.lz4 https://story-snapshot.shachopra.com:8443/downloads/snapshot_story.lz4
wget -O geth_story.lz4 https://story-snapshot.shachopra.com:8443/downloads/geth_story.lz4
```
### 5b. Download Story-Geth & Story Pruned Snapshot
```
cd $HOME
wget -O snapshot_story.lz4 https://story-snapshot2.shachopra.com:8443/downloads/snapshot_story.lz4
wget -O geth_story.lz4 https://story-snapshot2.shachopra.com:8443/downloads/geth_story.lz4
```
### 6. Decompress Story-Geth & Story Snapshot
```
lz4 -c -d snapshot_story.lz4 | pv | sudo tar -xv -C $HOME/.story/story/
lz4 -c -d geth_story.lz4 | pv | sudo tar -xv -C $HOME/.story/geth/iliad/geth/
```
### 7. Delete snapshot files after decompression
```
sudo rm snapshot_story.lz4
sudo rm geth_story.lz4
```
### 8. Move priv_validator_state.json back
```
sudo cp $HOME/.story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json
```
### 9. Restart Story & Story-Geth Node
```
sudo systemctl daemon-reload && sudo systemctl enable story-geth && sudo systemctl start story-geth
```
```
sudo systemctl daemon-reload && sudo systemctl enable story && sudo systemctl start story
```
