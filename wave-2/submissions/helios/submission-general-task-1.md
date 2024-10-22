# Story install script

This is an installation script for Story testnet which helps user get the node ready with just 1 command. This script also add story and geth peer so the node can quikcly cacth up with the chain.

## Overview
You can run this script directly in the command line, or create a file like this: `nano install.sh`:
```bash
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
story_ver=$(curl -s https://api.github.com/repos/piplabs/story/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
geth_ver=$(curl -s https://api.github.com/repos/piplabs/story-geth/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')

echo "Latest Story version: $story_ver"
echo "Latest Geth version: $geth_ver"

echo "Installing geth..."
git clone https://github.com/piplabs/story-geth && cd story-geth
git checkout $geth_ver
make geth
mv ./build/bin/geth $HOME/go/bin/geth
cd .. && rm -rf story-geth

echo "Installing story..."
git clone https://github.com/piplabs/story && cd story
git checkout $story_ver
go build -o story ./client
mv story $HOME/go/bin/story
cd .. && rm -rf story

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
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $HOME/.story/story/config/config.toml

# Start
systemctl restart geth story

# Add geth peer and restart geth
sleep 15
geth --exec 'admin.addPeer("enode://a86b76eb7171eb68c4495e1fbad292715eee9b77a34ffa5cf39e40cc9047e1c41e01486d1e31428228a1350b0f870bcd3b6c5d608ba65fe7b7fcba715a78eeb8@story-geth.mandragora.io:30303")' attach $HOME/.story/geth/iliad/geth.ipc
systemctl restart geth

echo -e "\e[32mAll services started!\e[0m"
```

> **Note**: If you want custom moniker for your node, please set the variable `MONIKER`.

To check the logs of the node, you can run these commands:
```bash
journalctl -fu story # get log for story
journalctl -fu geth # get log for geth
```