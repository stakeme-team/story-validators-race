# Guide to sync a Story Node from Snapshot (prunned + archive)

After you add a new node to the network, it can synchronize rapidly by applying a snapshot, which is a compact archive of the blockchain’s current data. Using a snapshot helps avoid the lengthy process of downloading and checking every single transaction from scratch.

- Snapshots are automatically updated every 6 hours

## 1. Node Stop

#### 1.1. Install dependencies
```bash
sudo apt-get install -y wget lz4 aria2 pv
```

#### 1.2. Stop the services
```bash
sudo systemctl stop story && sudo systemctl stop geth
```

#### 1.3. Backup the validator's current state
```bash
cp $HOME/.story/story/data/priv_validator_state.json $HOME/.story/priv_validator_state.json.backup
```

## 2. Snapshots Download: Prunned

#### 2.1. Remove existing data directories
```bash
rm -rf $HOME/.story/story/data
rm -rf $HOME/.story/geth/iliad/geth/chaindata
```
#### 2.2. Check the latest network snapshot URL
```bash
story_snapshot_url=$(curl -sL 'https://story-testnet-snapshots.go2pro.xyz' | grep -Eo '>iliad_story.*\.tar\.lz4' | sed 's/^>//' | head -n1)
geth_snapshot_url=$(curl -sL 'https://story-testnet-snapshots.go2pro.xyz' | grep -Eo '>iliad_geth.*\.tar\.lz4' | sed 's/^>//' | head -n1)
```
#### 2.3. Download Story snapshot
```bash
aria2c -x5 -s4 -d $HOME "https://story-testnet-snapshots.go2pro.xyz/${story_snapshot_url}"
```
#### 2.4. Download Geth snapshot
```bash
aria2c -x5 -s4 -d $HOME "https://story-testnet-snapshots.go2pro.xyz/${geth_snapshot_url}"
```

## 3. Snapshots Unpack

#### 3.1. Unpack Story
```bash
lz4 -dc $HOME/${story_snapshot_url} | pv -ptrb | tar -xf - -C $HOME/.story/story
```
#### 3.2. Move back the copied priv_validator_state.json
```bash
mv $HOME/.story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json
```
#### 3.3. Unpack Geth
```bash
lz4 -dc $HOME/${geth_snapshot_url} | pv -ptrb | tar -xf - -C $HOME/.story/geth/iliad/geth
```
## 4. Node Start

#### 4.1. Restart Story and Geth services
```bash
sudo systemctl start story && sudo systemctl start geth
```
#### 4.2. Remove snapshots if needed
```bash
rm -rf $HOME/${story_snapshot_url}
rm -rf $HOME/${geth_snapshot_url}
```

# Archive Snapshots

- Snapshots are automatically updated every 2 days

#### Check the latest network snapshot URL
```bash
story_snapshot_url=$(curl -sL 'https://story-testnet-snapshots-archive.go2pro.xyz/' | grep -Eo '>iliad_story.*\.tar\.lz4' | sed 's/^>//' | head -n1)
geth_snapshot_url=$(curl -sL 'https://story-testnet-snapshots-archive.go2pro.xyz/' | grep -Eo '>iliad_geth.*\.tar\.lz4' | sed 's/^>//' | head -n1)
```
#### Download Story snapshot
```bash
aria2c -x5 -s4 -d $HOME "https://story-testnet-snapshots-archive.go2pro.xyz/${story_snapshot_url}"
```
#### Download Geth snapshot
```bash
aria2c -x5 -s4 -d $HOME "https://story-testnet-snapshots-archive.go2pro.xyz/${geth_snapshot_url}"
```
