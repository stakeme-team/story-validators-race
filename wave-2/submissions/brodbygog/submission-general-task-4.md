see left block



while true; do 
  local_height=$(curl -s localhost:26657/status | jq -r '.result.sync_info.latest_block_height');
  network_height=$(curl -s https://rpc-story.josephtran.xyz/status | jq -r '.result.sync_info.latest_block_height');
  blocks_left=$((network_height - local_height));
  echo -e "\033[1;38mYour node height:\033[0m \033[1;34m$local_height\033[0m | \033[1;35mNetwork height:\033[0m \033[1;36m$network_height\033[0m | \033[1;29mBlocks left:\033[0m \033[1;31m$blocks_left\033[0m";
  sleep 5;
done


![photo_2024-10-21_18-28-37](https://github.com/user-attachments/assets/d86ccc32-869c-400f-8e5d-d3791c3ef6ed)