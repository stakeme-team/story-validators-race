Task 1: Automatic Installer for the Story Node
Overview
This script automates the installation, updates, and configuration of the Story Node and Story Geth, simplifying the setup process.

How to Use the Script
Create the Script File:
Create a file named install-story-node.sh and paste the following script code into it:

#!/bin/bash

# Update system and install essential packages
sudo apt update && sudo apt install -y curl git make jq build-essential gcc unzip wget lz4 aria2

# Install Go if not present
if ! command -v go &> /dev/null; then
    wget https://golang.org/dl/go1.22.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.22.linux-amd64.tar.gz
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile && source ~/.profile
fi

# Create Go bin directory if it doesn't exist
mkdir -p $HOME/go/bin

# Function to update Story Geth
update_story_geth() {
    wget -N https://story-geth-binaries.s3.us-west-1.amazonaws.com/geth-public/geth-linux-amd64-0.9.3-b224fdf.tar.gz
    tar -xzvf geth-linux-amd64-0.9.3-b224fdf.tar.gz
    if [ -f geth-linux-amd64-0.9.3-b224fdf/geth ]; then
        sudo cp geth-linux-amd64-0.9.3-b224fdf/geth $HOME/go/bin/story-geth
    else
        echo "Error: story-geth executable not found."
        exit 1
    fi
}

# Function to update Story binary
update_story() {
    wget -N https://story-geth-binaries.s3.us-west-1.amazonaws.com/story-public/story-linux-amd64-0.10.1-57567e5.tar.gz
    tar -xzvf story-linux-amd64-0.10.1-57567e5.tar.gz
    if [ -f story-linux-amd64-0.10.1-57567e5/story ]; then
        sudo cp story-linux-amd64-0.10.1-57567e5/story $HOME/go/bin/story
    else
        echo "Error: story executable not found."
        exit 1
    fi
}

# Update Story Geth and Story binaries
update_story_geth
update_story

# Verify versions
$HOME/go/bin/story-geth version
$HOME/go/bin/story version

# Clone or update Story Node
if [ ! -d "$HOME/story" ]; then
    git clone https://github.com/piplabs/story.git "$HOME/story"
else
    cd "$HOME/story" && git pull
fi

cd "$HOME/story" && git checkout v0.10.1 && go build -o story ./client && sudo cp story /usr/local/bin/

# Create JWT secret
mkdir -p /root/.story/geth/iliad/geth
openssl rand -hex 32 | sudo tee /root/.story/geth/iliad/geth/jwtsecret

# Initialize Story Node
sudo /usr/local/bin/story init --network iliad --moniker "Your_moniker_name"

# Update peers in config
sed -i 's/^seeds =.*/seeds = "5a0191a6bd8f17c9d2fa52386ff409f5d796d112@b1.testnet.storyrpc.io:26656,0e2f0d4b5204e5e92a994a1eaa745b9ccb1d747b@b2.testnet.storyrpc.io:26656"/' /root/.story/story/config/config.toml

# Create systemd service files for Story Geth
sudo tee /etc/systemd/system/story-geth.service > /dev/null <<EOF
[Unit]
Description=Story Geth Client
After=network.target

[Service]
User=root
ExecStart=/root/go/bin/story-geth --iliad --syncmode full
Restart=on-failure
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

# Create systemd service files for Story
sudo tee /etc/systemd/system/story.service > /dev/null <<EOF
[Unit]
Description=Story Consensus Client
After=network.target

[Service]
User=root
ExecStart=/usr/local/bin/story run
Restart=on-failure
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd
sudo systemctl daemon-reload

Replace Your Moniker Name:

Open the script and find the line where it says --moniker "Your_moniker_name". Replace "Your_moniker_name" with your actual moniker name (e.g., lovesong123).
Run the Script:

Make the script executable:
 chmod +x install-story-node.sh

Execute the script:
 ./install-story-node.sh

Start the Services:

After running the script, you can start the services using:
  sudo systemctl daemon-reload && \
  sudo systemctl start story-geth && \
  sudo systemctl enable story-geth && \
  sudo systemctl status story-geth

And
  sudo systemctl daemon-reload && \
  sudo systemctl start story && \
  sudo systemctl enable story && \
  sudo systemctl status story
  
  Link to public repo
My script is hosted at the public repo: https://github.com/huydt88/story-node-installer
