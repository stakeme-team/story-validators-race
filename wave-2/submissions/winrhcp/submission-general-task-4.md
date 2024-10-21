# Submission for Task 4: Useful Utility for Validators

## GitHub Repository
[Story Node Validator Alert](https://github.com/winrchp/story-validator-alert)

## Description
This utility is designed to help validators on the Story blockchain monitor their node status effectively. It checks the health of the node, retrieves the list of connected peers, and sends alerts via Telegram in case of any issues.

## Features
- **Node Health Check**: Monitors the health of the Story node by querying its health endpoint.
- **Peer Monitoring**: Lists all consensus peers that the node is synced with.
- **Telegram Alerts**: Sends alerts to a specified Telegram chat when the node becomes unhealthy.

## Requirements
- Go (version 1.16 or higher)
- A Telegram bot token and chat ID for sending alerts

## Installation and Usage

1. **Clone the Repository**
   ```bash
    git clone https://github.com/winrchp/story-validator-alert.git
    cd story-validator-alert

2. Build the Story alert You can build the Story alert by running:
    go build -o story-validator-alert

3. Create Configuration File Create a config.json file in the repository folder with the following structure:
{
    "telegramBotToken": "YOUR_TELEGRAM_BOT_TOKEN",
    "telegramChatID": "YOUR_TELEGRAM_CHAT_ID",
    "rpcEndpoint": "http://localhost:26657"
}

4. Run the Story alert Execute the Story alert:
    ./story-validator-alert