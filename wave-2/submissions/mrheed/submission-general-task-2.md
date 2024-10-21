## Snapshots Service

### Types of Snapshots
- **Pruned Snapshot**: A streamlined version of the blockchain that removes unnecessary historical data, optimizing storage and performance for nodes that do not require full historical records.
```bash
STORY_SNAPSHOT_URL="https://snapshots.aldebaranode.xyz/story/default/story.tar.lz4"
STORY_GETH_SNAPSHOT_URL="https://snapshots.aldebaranode.xyz/story/default/geth.tar.lz4"
(echo $STORY_SNAPSHOT_URL; echo $STORY_GETH_SNAPSHOT_URL) | aria2c -x 16 -s 16 -k 1M -i -
```
- **Archive Snapshot**: A comprehensive version of the blockchain, preserving all historical data for full node functionality and detailed analysis.
```bash
STORY_SNAPSHOT_URL="https://snapshots.aldebaranode.xyz/story/archive/story.tar.lz4"
STORY_GETH_SNAPSHOT_URL="https://snapshots.aldebaranode.xyz/story/archive/geth.tar.lz4"
(echo $STORY_SNAPSHOT_URL; echo $STORY_GETH_SNAPSHOT_URL) | aria2c -x 16 -s 16 -k 1M -i -
```

### Documentation
For more information, visit: [Applying Snapshots Guide](https://docs.aldebaranode.xyz/guide/testnet/story/installation#6-applying-snapshot)