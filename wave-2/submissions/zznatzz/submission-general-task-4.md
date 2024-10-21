Steps to Save and Run the Script:
1. Create the Script File
You’ll create a shell script that contains the code to manage your node.

Access your VPS or local terminal where your Story node is running.

Navigate to your preferred directory (e.g., your home directory or a dedicated folder for scripts):

bash
Copy code
cd ~
Create a new file for the script (you can name it node_maintenance.sh):

bash
Copy code
nano node_maintenance.sh
Paste the following code into the file:

bash
Copy code
#!/bin/bash

# Node sync status check
SYNC_STATUS=$(curl -s http://localhost:26657/status | jq -r '.result.sync_info.catching_up')
LATEST_BLOCK=$(curl -s http://localhost:26657/status | jq -r '.result.sync_info.latest_block_height')

if [ "$SYNC_STATUS" == "false" ]; then
  echo "Node is synced. Current block height: $LATEST_BLOCK"
else
  echo "Node is still syncing. Current block height: $LATEST_BLOCK"
fi

# Check if the Story node is running
if pgrep -x "story" > /dev/null
then
  echo "Node is running"
else
  echo "Node is not running. Restarting the node..."
  systemctl restart story.service
fi

# Tail the logs if needed (optional)
echo "Tailing the node logs for recent issues:"
journalctl -u story.service -n 10
Save the file:

After pasting the code, press CTRL + O, hit Enter to save, and then CTRL + X to exit the editor.
2. Make the Script Executable
Before running the script, you need to make it executable.

Run the following command to give it execution permissions:
bash
Copy code
chmod +x node_maintenance.sh
3. Install jq if needed
If you haven't installed jq (a command-line tool to parse JSON), you can install it using:

bash
Copy code
sudo apt-get install jq -y
4. Run the Script

Story Node Maintenance Utility

We can expand the script with useful features before you submit it. Here are some ideas:

Auto-updating the Story Node: We can automate checking for new versions and applying updates.
Automated Alerts: You can set up alerts via Telegram or email if the node goes down or encounters issues.
Scheduled Automation: Use cron jobs to run the script periodically to ensure the node is always monitored.
Now you can run the script to check the status of your Story node and restart it if needed.

To execute the script, run:
bash
Copy code
./node_maintenance.sh
You should see output indicating whether the node is synced, if it’s running, and a quick log of recent activity.
