https://services.lavenderfive.com/testnet/story/snapshot

```
sudo systemctl stop story
cp .story/story/data/priv_validator_state.json .story/story/priv_validator_state.json.backup
rm -rf .story/story/data
curl -L https://snapshots.lavenderfive.com/testnet-snapshots/story/story_1256310.tar.lz4 | tar -Ilz4 -xf - -C .story/story/
mv .story/story/priv_validator_state.json.backup .story/story/data/priv_validator_state.json
sudo systemctl start story && sudo journalctl -u story -f --no-hostname -o cat
```