# Story install script

This is an installation script for Story testnet which helps user get the node ready with just 1 command. This script also add story and geth peer so the node can quikcly cacth up with the chain.

## Overview
You can run this script directly in the command line, or create a file like this: nano install.sh:
#!/bin/bash
MONIKER=<your-moniker>

# Check go
if ! which go > /dev/null; then
echo "Go is not installed"
exit 1
fi

# Install binaries
echo -ne "\033[1;33mInstalling binaries...\033[0m"
cd $HOME/go/bin

wget -qO- https://story-geth-binaries.s3.us-west-1.amazonaws.com/geth-public/geth-linux-amd64-0.9.3-b224fdf.tar.gz | tar xzf -
mv geth-*/geth . && rm -rf geth-*
wget -qO- https://story-geth-binaries.s3.us-west-1.amazonaws.com/story-public/story-linux-amd64-0.10.1-57567e5.tar.gz | tar xzf -
mv story-*/story . && rm -rf story-*
echo -e "\e[32mDone!\e[0m"

# Init
echo -e "\033[1;33mInitializing...\033[0m"
story init --moniker $MONIKER --network iliad


# Create services
echo -e "\033[1;33mCreating services...\033[0m"
sudo tee /etc/systemd/system/geth.service > /dev/null <<EOF
[Unit]
Description=Geth Client
After=network.target

[Service]
ExecStart=$(which geth) --iliad --syncmode full
Restart=on-failure
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

sudo tee /etc/systemd/system/story.service > /dev/null <<EOF
[Unit]
Description=Story Client
After=network.target

[Service]
ExecStart=$(which story) run
Restart=on-failure
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable story geth


# Add peers
PEERS=$(curl -sS https://story-rpc.mandragora.io/net_info | jq -r '.result.peers[] | "\(.node_info.id)@\(.remote_ip):\(.node_info.listen_addr)"' | awk -F ':' '{print $1":"$(NF)}' | paste -sd, -)
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $HOME.story/story/config/config.toml
geth --exec 'admin.addPeer("enode://a86b76eb7171eb68c4495e1fbad292715eee9b77a34ffa5cf39e40cc9047e1c41e01486d1e31428228a1350b0f870bcd3b6c5d608ba65fe7b7fcba715a78eeb8@story-geth.mandragora.io:30303")' attach $HOME/.story/geth/iliad/geth.ipc

# Start
systemctl restart geth story
echo -e "\e[32mAll services started!\e[0m"


**Note**: If you want custom moniker for your node, please set the variable `MONIKER`.


To check the logs of the node, you can run these commands:
journalctl -fu story # get log for story
journalctl -fu geth # get log for geth