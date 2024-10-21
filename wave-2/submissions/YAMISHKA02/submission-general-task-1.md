#!/bin/bash

# Color variables
RED='\033[0;31m'
BLUE='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Default snapshot URLs (replace with real links)
DEFAULT_STORY_SNAPSHOT="https://story.josephtran.co/Story_snapshot.lz4"
DEFAULT_GETH_SNAPSHOT="https://story.josephtran.co/Geth_snapshot.lz4"

# Function to print colored output
print_color() {
    case $1 in
        "blue") COLOR=$BLUE ;;
        "red") COLOR=$RED ;;
        "yellow") COLOR=$YELLOW ;;
        *) COLOR=$NC ;;
    esac
    echo -e "${COLOR}$2${NC}"
}

# Function to check command status
check_status() {
    if [ $? -eq 0 ]; then
        print_color "blue" "✓ $1"
    else
        print_color "red" "✗ $1"
        exit 1
    fi
}

# Function to select language
select_language() {
    clear
    echo "Choose your language / Выберите язык:"
    echo "1) English"
    echo "2) Русский"
    read -p "Enter choice: " lang_choice

    if [ "$lang_choice" == "1" ]; then
        LANGUAGE="ENG"
    elif [ "$lang_choice" == "2" ]; then
        LANGUAGE="RU"
    else
        echo "Invalid choice"
        select_language
    fi
}

# Function to log messages in different languages
log_message() {
    case $2 in
        "dependencies") 
            if [[ $LANGUAGE == "RU" ]]; then 
                print_color $1 "Установка зависимостей..."
            else 
                print_color $1 "Installing dependencies..." 
            fi
            ;;
        "core_download")
            if [[ $LANGUAGE == "RU" ]]; then 
                print_color $1 "Загрузка и установка Story-Geth..."
            else 
                print_color $1 "Downloading and installing Story-Geth..."
            fi
            ;;
        "binary_download")
            if [[ $LANGUAGE == "RU" ]]; then 
                print_color $1 "Загрузка и установка Story binary..."
            else 
                print_color $1 "Downloading and installing Story binary..."
            fi
            ;;
        "node_init")
            if [[ $LANGUAGE == "RU" ]]; then 
                print_color $1 "Инициализация узла..."
            else 
                print_color $1 "Initializing node..."
            fi
            ;;
        "services")
            if [[ $LANGUAGE == "RU" ]]; then 
                print_color $1 "Настройка сервисов..."
            else 
                print_color $1 "Setting up services..."
            fi
            ;;
        "install_complete")
            if [[ $LANGUAGE == "RU" ]]; then 
                print_color $1 "Установка завершена!"
            else 
                print_color $1 "Installation completed!"
            fi
            ;;
    esac
}

# Install dependencies
setup_environment() {
    log_message "blue" "dependencies"
    sudo apt update
    sudo apt-get update
    sudo apt install curl git make jq build-essential gcc unzip wget lz4 aria2 -y
    check_status "Dependencies installed"
}

# Download and install Story-Geth
fetch_core() {
    log_message "blue" "core_download"
    wget https://story-geth-binaries.s3.us-west-1.amazonaws.com/geth-public/geth-linux-amd64-0.9.2-ea9f0d2.tar.gz
    tar -xzvf geth-linux-amd64-0.9.2-ea9f0d2.tar.gz
    rm geth-linux-amd64-0.9.2-ea9f0d2.tar.gz
    [ ! -d "$HOME/go/bin" ] && mkdir -p $HOME/go/bin
    if ! grep -q "$HOME/go/bin" $HOME/.bash_profile; then
        echo "export PATH=$PATH:/usr/local/go/bin:~/go/bin" >> ~/.bash_profile
    fi
    sudo cp geth-linux-amd64-0.9.2-ea9f0d2/geth $HOME/go/bin/story-geth
    rm -rf geth-linux-amd64-0.9.2-ea9f0d2
    source $HOME/.bash_profile
    story-geth version
    check_status "Story-Geth installed"
}

# Download and install Story binary
fetch_secondary() {
    log_message "blue" "binary_download"
    wget https://story-geth-binaries.s3.us-west-1.amazonaws.com/story-public/story-linux-amd64-0.9.13-b4c7db1.tar.gz
    tar -xzvf story-linux-amd64-0.9.13-b4c7db1.tar.gz
    rm story-linux-amd64-0.9.13-b4c7db1.tar.gz
    cp $HOME/story-linux-amd64-0.9.13-b4c7db1/story $HOME/go/bin
    rm -rf $HOME/story-linux-amd64-0.9.13-b4c7db1
    source $HOME/.bash_profile
    story version
    check_status "Story binary installed"
}

# Initialize the node
initialize_node() {
    local alias=$1
    log_message "blue" "node_init"
    story init --network iliad --moniker "$alias"
    check_status "Node initialized"
}

# Create and enable services
configure_services() {
    log_message "blue" "services"
    # Create story-geth service file
    sudo tee /etc/systemd/system/story-geth.service > /dev/null <<EOF
[Unit]
Description=Story Geth Client
After=network.target

[Service]
User=root
ExecStart=/root/go/bin/story-geth --iliad --syncmode full
Restart=on-failure
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

    # Create story service file
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

    check_status "Service files created"
}

# Start and enable services
activate_services() {
    log_message "blue" "services"
    sudo systemctl daemon-reload
    sudo systemctl start story-geth
    sudo systemctl enable story-geth
    sudo systemctl start story
    sudo systemctl enable story
    check_status "Services started"
}

# Restore backups if available
restore_backups() {
    log_message "blue" "restoring_backup"
    # Backup restoration logic (if needed)
}

# Main function
install_node() {
    select_language
    read -p "$(if [[ $LANGUAGE == "RU" ]]; then echo 'Введите название ноды: '; else echo 'Enter node alias: '; fi)" alias
    setup_environment
    fetch_core
    fetch_secondary
    initialize_node "$alias"
    configure_services
    activate_services
    restore_backups
    log_message "success" "install_complete"
}

# Call the main function
install_node
