# Story Automation script

This is the bash script to automatically install and run the lastest Story and Geth node.

To get started, download this script:
```bash
wget -O install.sh https://gist.githubusercontent.com/LianD-09/780d712a17bf29597b696b56aae59b29/raw/ca4d848f5fa04557ab4f0d3146574b4af8a409c1/install.sh
```

Then you can run the script to install both Geth and Story nodes. The script will automatically get the latest version of Geth and Story, find the peers and latest snapshot, create system services, and start the node.
```bash
bash install.sh <your-moniker>
```

You can check your node status with these commands:
```bash
# Story
journalctl -fu story -n150

# Geth
journalctl -fu geth -n150
```
