# Story Archive and Prune snapshots

We provide both archival and pruned snapshots, which are created every 8 hours. For pruned snapshots, we configured pruning to custom, as well as added `min-retain-blocks` config param so we can save the size as much as possible.

You can see the name of the snapshot file in this url: https://story-snapshot.artsakh.network

## Archive snapshots
- Geth: https://story-snapshot.artsakh.network/archive/geth.tar.lz4
- Story: https://story-snapshot.artsakh.network/archive/story.tar.lz4

Here is the instruction
```bash
cd $HOME/.story/
wget https://story-snapshot.artsakh.network/archive/geth.tar.lz4
wget https://story-snapshot.artsakh.network/archive/story.tar.lz4
systemctl stop story geth
mv story.tar.lz4 story/
cd story 
mv data/priv_validator_state.json . && rm -rf data
lz4 -dv story.tar.lz4 | tar xvf -
mv priv_validator_state.json data/
rm story.tar.lz4
cd ../geth/iliad/geth
rm -rf chaindata
lz4 -dv geth.tar.lz4 | tar xvf -
rm geth.tar.lz4
systemctl restart geth story
```

## Pruned snapshots
- Geth: https://story-snapshot.artsakh.network/pruned/geth.tar.lz4
- Story: https://story-snapshot.artsakh.network/pruned/story.tar.lz4

Here is the instruction
```bash
cd $HOME/.story/
wget https://story-snapshot.artsakh.network/pruned/geth.tar.lz4
wget https://story-snapshot.artsakh.network/pruned/story.tar.lz4
systemctl stop story geth
mv story.tar.lz4 story/
cd story 
mv data/priv_validator_state.json . && rm -rf data
lz4 -dv story.tar.lz4 | tar xvf -
mv priv_validator_state.json data/
rm story.tar.lz4
cd ../geth/iliad/geth
rm -rf chaindata
lz4 -dv geth.tar.lz4 | tar xvf -
rm geth.tar.lz4
systemctl restart geth story
```
