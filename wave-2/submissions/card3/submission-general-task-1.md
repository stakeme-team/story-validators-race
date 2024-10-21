#  Automatic installer for the Story node

For ubuntu 22.04:

- Install latest story (v0.11.0) and geth (v0.9.4) binary
- Run story by using COSMOVISOR tool so that can automatically upgrade by config the blockheight
- Include downloading snapshots for both story and geth
  - current two kinds of snapshot, pick one of them
  - prune has no tx index 
  - archive is much larger than prune 
- Make sure you have  human-readable identifier for your node (your moniker name)

```bash
    # Using prune snapshot 
    wget -O install.sh https://raw.githubusercontent.com/card3/story-validator/refs/heads/main/scripts/install.sh && chmod +x install.sh && \
    ./install.sh -m  <your moniker name>
    # If using archive snapshot, run below 
    wget -O install.sh https://raw.githubusercontent.com/card3/story-validator/refs/heads/main/scripts/install.sh && chmod +x install.sh && \
        ./install.sh -m <your moniker name > --archive
```
