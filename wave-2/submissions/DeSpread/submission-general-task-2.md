![Story Protocol DeSpread Banner](https://raw.githubusercontent.com/DeSpread/story-validator/refs/heads/main/story-validators-race/wave-2/despread.jpg)

## Our validator platform snaphost link
The contents of the link are as follows 
https://vp.despreadlabs.io/explorer/service/snapshot/testnet/story

## Pruned snapshot
Height of the snapshot: 1452764

### Install Tools
```
sudo apt-get install wget gzip -y
```

### Check your client version
- story-geth: v0.9.3
- story: v0.11.0

### Backup priv_validator_state.json
```
sudo cp $HOME/.story/story/data/priv_validator_state.json $HOME/.story/priv_validator_state.json.backup
```

### Clear old data
```
sudo rm -rf $HOME/.story/geth/iliad/geth/chaindata
```
```
sudo rm -rf $HOME/.story/story/data
```

### Download story prunned snapshot
```
wget -O story_snapshot.tar.gz https://despread-labs.s3.ap-northeast-2.amazonaws.com/node/story/testnet/snapshot/prune/story_snapshot_2024-10-15_10-37-55.tar.gz
```

### Download story-geth snapshot
```
wget -O story_geth_snapshot.tar.gz https://despread-labs.s3.ap-northeast-2.amazonaws.com/node/story/testnet/snapshot/prune/story_geth_snapshot_2024-10-15_10-38-06.tar.gz
```

### Decompress story snapshot
```
tar -xzvf story_snapshot.tar.gz -C ~/.story/story
```

### Decompress story-geth snapshot
```
tar -xzvf story_geth_snapshot.tar.gz -C ~/.story/geth/iliad/geth
```

### Restore priv_validator_state.json
```
mv $HOME/.story/story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json
```

### Delete downloaded snapshots
```
sudo rm -v story_snapshot.tar.gz
```
```
sudo rm -v story_geth_snapshot.tar.gz
```


### Restart node
```
sudo systemctl start story
```
```
sudo systemctl start story-geth
```

### Check logs
```
sudo journalctl -u story -f -o cat
```
```
sudo journalctl -u story-geth -f -o cat
```

&nbsp;


## Archive snapshot
Height of the snapshot: 1448717

### Install Tools
```
sudo apt-get install wget gzip -y
```

### Check your client version
- story-geth: v0.9.3
- story: v0.11.0

### Check story config
Open story.toml set pruning option to nothing 
```
vim $HOME/.story/story/config/story.toml 
```
Check pruning option to nothing in story.toml
``` 
pruning = "nothing" 
```

### Check evm run option
Open geth run service
```
sudo vim /etc/systemd/system/story-geth.service
```
Check run option --gcmode archive 
```
ExecStart=$HOME/go/bin/story-geth --iliad --syncmode full --gcmode archive
```

### Backup priv_validator_state.json
```
sudo cp $HOME/.story/story/data/priv_validator_state.json $HOME/.story/priv_validator_state.json.backup
```

### Remove old data
```
sudo rm -rf $HOME/.story/geth/iliad/geth/chaindata
```
```
sudo rm -rf $HOME/.story/story/data
```


### Download story archive snapshot
```
wget -O story_snapshot.tar.gz https://despread-labs.s3.ap-northeast-2.amazonaws.com/node/story/testnet/snapshot/archive/story_snapshot_2024-10-15_06-09-39.tar.gz
```

### Download story-geth snapshot
```
wget -O story_geth_snapshot.tar.gz https://despread-labs.s3.ap-northeast-2.amazonaws.com/node/story/testnet/snapshot/archive/story_geth_snapshot_2024-10-15_06-10-40.tar.gz
```

### Decompress story snapshot
```
tar -xzvf story_snapshot.tar.gz -C ~/.story/story
```

### Decompress story-geth snapshot
```
tar -xzvf story_geth_snapshot.tar.gz -C ~/.story/geth/iliad/geth
```

### Restore priv_validator_state.json
```
mv $HOME/.story/story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json
```

### Delete downloaded snapshots
```
sudo rm -v story_snapshot.tar.gz
```
```
sudo rm -v story_geth_snapshot.tar.gz
```


### Restart node
```
sudo systemctl start story
```
```
sudo systemctl start story-geth
```

### Check logs
```
sudo journalctl -u story -f -o cat
```
```
sudo journalctl -u story-geth -f -o cat
```