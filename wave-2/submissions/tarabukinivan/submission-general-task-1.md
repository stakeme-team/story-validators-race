Manual Install and Autoinstall [https://snapshots.tarabukin.work/installation.html](https://snapshots.tarabukin.work/installation.html)

Installation video https://youtu.be/FXUwGyrNtIA

## Installation from height 0. Story version v0.11.0, Geth version v0.9.4 from archive snapshot:
```
source <(curl -s https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/auto_story_statesynced.sh)
```
[Snapshot info](https://snapshots.tarabukin.work/)

## Installation pruned snapshot Story version v0.11.0, Geth version v0.9.4:

```
source <(curl -s https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/story_pruned.sh)
```
[Snapshot Info](https://snapshots.tarabukin.work/index.html)

## Installation from Story Statesync. Story version v0.11.0, Geth version v0.9.4

Statesync has become very poorly synchronized. Use snap <br>


[Geth archive snapshot info](https://snapshots.tarabukin.work/storygeth/snap_info.txt)
```
source <(curl -s https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/story_statesynf_etharch.sh)
```

## Installation from height 0 (Old version). Story version v0.9.3, Geth version v0.9.3 is installed. On version v0.10.1 we get the apphash.
Autoinstallation with custom ports:
```
wget -O auto_story.sh https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/auto_story.sh && chmod a+x auto_story.sh && ./auto_story.sh
```

### updating the binary at 626575 to v0.10.1
<p>check node height: (If you have changed the port, replace the ‘26’ number at the beginning with the port you are using and try.)</p>

```
curl -s http://localhost:26657/status | jq .result.sync_info
```
Make sure latest_block_height = 626575

<p>autoupdate</p>

```
source <(curl -s https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/story_upgrade.sh)
```

### Automatic update when block 626575 is reached. Run in tmux

```
apt install tmux -y
tmux new-session -s storyupd
source <(curl -s https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/story_autoupgrade)
```
  


##### If you have changed the port, replace the ‘26’ number at the beginning with the port you are using and try. Port ‘26’ is the default port number.
```console
curl localhost:26657/status | jq
```

Make sure catching_up = false

### We export the wallet you created and add the private key to the Matemask Wallet. Then we request Token via Faucet and apply the following codes to create Validator.

## [Faucet 1](https://faucet.story.foundation/) - [Faucet 2](https://thirdweb.com/story-iliad-testnet) - [Faucet 3](https://faucet.quicknode.com/story)

```console
# Wallet Export
story validator export --export-evm-key
```
```console
# Copy the Private key here
sudo nano ~/.story/story/config/private_key.txt
```
```console
# Create Validator
story validator create --stake 1000000000000000000 --private-key "your_private_key"
```
