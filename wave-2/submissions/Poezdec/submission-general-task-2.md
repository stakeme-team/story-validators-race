# **Story Snap in one click**

## **Installation:**

```bash
bash <(curl -s https://raw.githubusercontent.com/Poezdec/story-oneclick/main/story_snap_oneclick.sh)
```

### **Check sync status:**
```
curl localhost:26657/status | jq
```

### **Check sync status (how much left in the blocks to finish):**

```
while true; do
    local_height=$(curl -s localhost:26657/status | jq -r '.result.sync_info.latest_block_height');
    network_height=$(curl -s https://story-cosmos-testnet-rpc.tech-coha05.xyz/status | jq -r '.result.sync_info.latest_block_height');
    blocks_left=$((network_height - local_height));
    echo -e "\033[1;38mYour node height:\033[0m \033[1;34m$local_height\033[0m | \033[1;35mNetwork height:\033[0m \033[1;36m$network_height\033[0m | \033[1;29mBlocks left:\033[0m \033[1;31m$blocks_left\033[0m";
    sleep 5;
done
```

**The original guide to installing the node:**
https://docs.story.foundation/docs/node-setup

_by poezdec_
https://github.com/Poezdec/story-oneclick
