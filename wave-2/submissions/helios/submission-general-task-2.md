# Story snapshots services
We provide archive and prune snapshots, and excluded `priv_validator_state.json` file from the snapshot to avoid the risk of double-signed. The snapshots are created every 10 hours, can you can check the list here: https://snapshots.evecoin.io:443

You can also check the height of each snapshot in `height.txt`: https://snapshots.evecoin.io/archive/height.txt or https://snapshots.evecoin.io/pruned/height.txt

## Instructions
Here is the instruction for installing new snapshot. User will need to provide which type of snapshot to continue:

```bash
cd $HOME/.story/
wget -O install.sh https://gist.githubusercontent.com/linhtrang1602/fc9cd72dff320ec1807310c4f816d7da/raw/15638b4a74ae47a30848aee7a32e11b00c26df22/snapshot.sh
bash install.sh pruned|archive
```
The file will automatically stop the node, download the chosen snapshot and backup your priv_validator_state.json before decompressing and restart the node.

The script assumes you run story and geth as services `story.service` and `geth.service`. If not, download the script and adjust yourself.
