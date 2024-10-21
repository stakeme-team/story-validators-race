Install tool
Terminal window
sudo apt-get install wget lz4 aria2 pv -y

Stop node
Terminal window
sudo systemctl stop story
sudo systemctl stop story-geth

Download snapshot
Note

Choose Prune or Archive snapshot. Please do one of them only.
Prune snapshot:  1335051          |         Archive snapshot:  1304407

Story data:

Prune snapshot
Archive snapshot
Terminal window
#90.57 Gb, pruning = "default", disables state snapshots, app-db-backend = "goleveldb"
cd $HOME
rm -f Story_snapshot.lz4
aria2c -x 16 -s 16 -k 1M https://story.josephtran.co/Story_snapshot.lz4

Geth data:

Prune snapshot
Archive snapshot
Terminal window
#35.57 Gb
cd $HOME
rm -f Geth_snapshot.lz4
aria2c -x 16 -s 16 -k 1M https://story.josephtran.co/Geth_snapshot.lz4

Backup priv_validator_state.json
Terminal window
cp ~/.story/story/data/priv_validator_state.json ~/.story/priv_validator_state.json.backup

Remove old data
Terminal window
rm -rf ~/.story/story/data
rm -rf ~/.story/geth/iliad/geth/chaindata

Decompress snapshot
Prune snapshot
Archive snapshot
Terminal window
sudo mkdir -p /root/.story/story/data
lz4 -d -c Story_snapshot.lz4 | pv | sudo tar xv -C ~/.story/story/ > /dev/null

Prune snapshot
Archive snapshot
Terminal window
sudo mkdir -p /root/.story/geth/iliad/geth/chaindata
lz4 -d -c Geth_snapshot.lz4 | pv | sudo tar xv -C ~/.story/geth/iliad/geth/ > /dev/null

Move priv_validator_state.json back
Terminal window
cp ~/.story/priv_validator_state.json.backup ~/.story/story/data/priv_validator_state.json

Restart node
Terminal window
sudo systemctl start story
sudo systemctl start story-geth


*Thanks to JOesphTran for the guide*
