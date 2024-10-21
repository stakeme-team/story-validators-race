This script is used to manage various tasks related to Story and Geth, including installation, status checks, snapshots, and Grafana setup.


Use the following command in your terminal:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/hanhuynh1192/story-tasks/main/task4.sh)
```



The script performs the following tasks:

 - Install the latest Story
 - Install the latest Geth-Story
 - Check the current status of Story and Geth
 - Check the latest block the process is working on
 - Install a snapshot for the process
 - Refresh the process if there are any errors
 - Get user's keys (public key, private key, public address)
 - Start Story
 - Stop Story
 - Restart Story
 - Get the latest block from testnet/server
 - Install Grafana
 - Stop Grafana
 - Uninstall Grafana
