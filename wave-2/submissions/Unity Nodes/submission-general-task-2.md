### Service website
https://services.unitynodes.com/testnet-network/story-protocol/sync/snapshots

### Copy and paste the command on your server.
sudo systemctl stop story

cp $HOME/.story/story/data/priv_validator_state.json $HOME/.story/story/priv_validator_state.json.backup

story tendermint unsafe-reset-all --home $HOME/.story/story --keep-addr-book

curl -s https://snapshots-testnet.unitynodes.com/story-testnet/story-testnet-latest.tar.lz4 --output /tmp/story-testnet-latest.tar.lz4
lz4 -dc /tmp/story-testnet-latest.tar.lz4 | tar -xf - -C $HOME/.story/story data
lz4 -dc /tmp/story-testnet-latest.tar.lz4 | tar -xf - -C $HOME/.story/geth/iliad/geth/ chaindata

mv $HOME/.story/story/priv_validator_state.json.backup $HOME/.story/story/data/priv_validator_state.json

sudo systemctl restart story
sudo journalctl -u story -f -o cat
