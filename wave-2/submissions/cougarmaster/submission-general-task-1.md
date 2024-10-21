Auto installer script for Story Node
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
An automated script to install with little intervention.

#!/bin/bash

# Update and Upgrade VPS
sudo apt update && sudo apt upgrade -y

# Go installation
cd $HOME
ver="1.22.0"
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"
echo "export PATH=\$PATH:/usr/local/go/bin:\$HOME/go/bin" >> ~/.bash_profile
source ~/.bash_profile
go version

# Install Story-Geth Binary
wget -q https://story-geth-binaries.s3.us-west-1.amazonaws.com/geth-public/geth-linux-amd64-0.9.3-b224fdf.tar.gz -O /tmp/geth-linux-amd64-0.9.3-b224fdf.tar.gz
tar -xzf /tmp/geth-linux-amd64-0.9.3-b224fdf.tar.gz -C /tmp
[ ! -d "$HOME/go/bin" ] && mkdir -p $HOME/go/bin
cp /tmp/geth-linux-amd64-0.9.3-b224fdf/geth $HOME/go/bin/story-geth

# Install Story Binary
wget -q https://story-geth-binaries.s3.us-west-1.amazonaws.com/story-public/story-linux-amd64-0.10.1-57567e5.tar.gz -O /tmp/story-linux-amd64-0.10.1-57567e5.tar.gz
tar -xzf /tmp/story-linux-amd64-0.10.1-57567e5.tar.gz -C /tmp
cp /tmp/story-linux-amd64-0.10.1-57567e5/story $HOME/go/bin/story

# Init the Iliad Network Node
$HOME/go/bin/story init --network iliad

# Systemd Service for Story-Geth
sudo tee /etc/systemd/system/story-geth.service > /dev/null <<EOF
[Unit]
Description=Story Geth Client
After=network.target

[Service]
User=root
WorkingDirectory=/root/.story
ExecStart=/root/go/bin/story-geth --iliad --syncmode full
Restart=on-failure
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

# Systemd Service for Story
sudo tee /etc/systemd/system/story.service > /dev/null <<EOF
[Unit]
Description=Story Consensus Client
After=network.target

[Service]
User=root
ExecStart=/root/go/bin/story run
Restart=on-failure
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

# Enable Services
sudo systemctl daemon-reload
sudo systemctl enable story-geth story
sudo systemctl start story-geth story

# Service Status
sudo systemctl status story-geth --no-pager -l
sudo systemctl status story --no-pager -l

# Logs Story-Geth and Story
sudo journalctl -u story-geth -f -o cat &
sudo journalctl -u story -f -o cat

# Sync Status
curl -s localhost:26657/status | jq

Done
