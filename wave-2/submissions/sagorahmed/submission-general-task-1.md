Sometimes, persistent_peers you used in the config.toml gets inactive. By using this code, you will be able to update the persistent_peers automatically. You can set the scheduled time you want to update the persistent_peers. Follow the steps:

1. Open your VPS and create a shell script file called update_peers.sh.
``` nano ~/update_peers.sh ```
2. Add this script into that file.
```
sudo systemctl stop story && sudo systemctl stop story-geth
PEERS=$(curl -s -X POST https://rpc-story.josephtran.xyz -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"net_info","params":[],"id":1}' | jq -r '.result.peers[] | select(.connection_status.SendMonitor.Active == true) | "\(.node_info.id)@\(if .node_info.listen_addr | contains("0.0.0.0") then .remote_ip + ":" + (.node_info.listen_addr | sub("tcp://0.0.0.0:"; "")) else .node_info.listen_addr | sub("tcp://"; "") end)"' | tr '\n' ',' | sed 's/,$//' | awk '{print "\"" $0 "\""}')
sed -i "s/^persistent_peers *=.*/persistent_peers = $PEERS/" "$HOME/.story/story/config/config.toml"
    if [ $? -eq 0 ]; then
echo -e "Configuration file updated successfully with new peers"
    else
echo "Failed to update configuration file."
fi 
sudo systemctl daemon-reload
sudo systemctl enable story story-geth
sudo systemctl restart story story-geth
```

Save and exit the file. It will fetch the live/active peers. I used Josephtran's script to fetch the peers.

3. Run the following command to make the script executable.
``` chmod +x ~/update_peers.sh ``` 

4. Now, set up the cron job to run the script every 24 hours. Open the crontab editor:
 ``` crontab -e  ```
 
5. Add the following line at the bottom of the file:
``` 0 0 * * * /bin/bash ~/update_peers.sh ```

This will run the script every day at midnight (00:00). Adjust the time if you'd like to run it at a different hour.
