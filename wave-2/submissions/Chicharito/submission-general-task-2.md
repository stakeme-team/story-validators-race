
### Stop Node Services
```
sudo systemctl stop story
sudo systemctl stop story-geth
```
### Backup `priv_validator_state.json`
```
cp $HOME/.story/story/data/priv_validator_state.json $HOME/.story/story/priv_validator_state.json.backup
```
### Remove Old Data
```
rm -rf $HOME/.story/story/data
rm -rf $HOME/.story/geth/iliad/geth/chaindata
```
### Download Story Snapshot
```
curl https://snapshot.node9x.com/story_testnet.tar.lz4 | lz4 -dc - | tar -xf - -C $HOME/.story
```
### Restore `priv_validator_state.json`
```
mv $HOME/.story/story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json
```
### Restart Node Services
```
sudo systemctl start story
sudo systemctl start story-geth
```
