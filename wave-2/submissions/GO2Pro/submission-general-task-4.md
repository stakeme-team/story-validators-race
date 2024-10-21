# Story Peers Manager

This script is designed to ensure that a blockchain node remains synchronized with the master node by monitoring its block height.

If the local node falls behind the master by a predefined number of blocks, specified by BLOCK_DIFF_THRESHOLD, the script fetches peer data from other nodes to update the local node’s peer list. This helps the node catch up if it's lagging because its current peers are not providing the latest block data.

The goal is to keep the node well-connected and up-to-date with the network to maintain optimal performance and reliability.

**Technical Description:**

- `BLOCK_DIFF_THRESHOLD`: This sets the number of blocks by which if our node is lagging behind the master node, it will trigger an update of the peers to help catch up.

**Key Components of the Script:**
- Fetching Block Information: Retrieves and compares block heights from the local node and the master server.
- Peer Management: Updates peer information if the local node is significantly behind.
- Service Management: Manages the node service based on syncing needs.
- Logging and Record Keeping: Maintains logs and records of block height differences.
- Error Handling: Manages errors related to connectivity and data fetching.

## Quick Start
To setup the script, execute the following command in your Ubuntu terminal:

```bash
wget -q -O story_peers_setup.sh https://api.go2pro.xyz/story_peers_setup.sh && sudo chmod +x story_peers_setup.sh && ./story_peers_setup.sh
```

## Repository Link

The script is hosted on GitHub, accessible here:

```bash
https://github.com/GO2Pro/nodes/blob/main/story/persistent_peers_updater.md
```
