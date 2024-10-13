# General Task 2: Service for providing archive & pruned snapshots (piki-node)

This task provides a service to download archive and pruned snapshots for the Story node. Snapshots are hosted on the domain https://piki-nodes.xyz, and users can restore their nodes using the instructions below.

## Pruned Snapshot Download

To download and restore the **pruned snapshot**, run the following commands:

```bash
# Restore pruned snapshot for Story node data
curl https://piki-nodes.xyz/download/pruned-snapshot--20241012055849.tar.lz4 | lz4 -dc - | tar -xf - -C $HOME/.story/story

# Restore pruned snapshot for Geth node data
curl https://piki-nodes.xyz/download/pruned-snapshot--20241012055849.tar.lz4 | lz4 -dc - | tar -xf - -C $HOME/.story/geth/iliad/geth
