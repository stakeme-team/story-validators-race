
# Story Node Management Telegram Bot

A comprehensive Telegram bot for managing and monitoring Story nodes, providing real-time status updates, system metrics, and administrative controls.


![Screenshot 2024-10-20 125952](https://github.com/user-attachments/assets/780c0565-b5d3-4a1e-99e0-7e81e13ed633)


## 📑 Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Automatic Installation](#automatic-installation)
  - [Manual Installation](#manual-installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Bot Commands](#bot-commands)
- [Monitoring Features](#monitoring-features)
- [Uninstallation](#uninstallation)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## 🚀 Features

- **Real-time Node Monitoring:**
  - Block height synchronization status
  - Node performance metrics
  - Network statistics
  - Validator information

- **System Management:**
  - Service status monitoring (story & story-geth)
  - Service restart capabilities
  - Log viewing and filtering
  - System resource monitoring

- **Performance Metrics:**
  - CPU usage and frequency
  - Memory utilization
  - Disk I/O statistics
  - Network traffic analysis

- **Automated Monitoring:**
  - Configurable monitoring intervals
  - Automatic alerts for synchronization issues
  - System resource threshold notifications

## 📋 Prerequisites

- Python 3.10
- Active Story node
- Telegram account
- Bot token from [@BotFather](https://t.me/botfather)
- Root or sudo privileges

## 💻 Installation

### Automatic Installation

1. Download the installation script:
```bash
wget https://raw.githubusercontent.com/0xlimon/story-wave2-task4-Useful-utility-for-validators/main/install.sh
```

2. Make it executable:
```bash
chmod +x install.sh
```

3. Run the script:
```bash
sudo ./install.sh
```

4. Follow the interactive prompts to configure your bot:
   - Enter your Telegram Bot Token
   - Specify monitoring interval (in minutes)
   - Enter node port (default: 26657)
   - Provide your Telegram Admin ID
   - Configure service names if different from defaults

### Manual Installation

1. Install required system packages:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip git
```

2. Create directory for the bot:
```bash
sudo mkdir -p /root/story-telegram-bot
cd /root/story-telegram-bot
```

3. Install Python dependencies:
```bash
sudo pip3 install aiohttp==3.10.8 psutil==6.0.0 python-dotenv==1.0.1 python-telegram-bot==21.6
```

4. Download bot files:
```bash
sudo wget -O bot.py https://raw.githubusercontent.com/0xlimon/story-wave2-task4-Useful-utility-for-validators/main/bot.py
```

5. Create and configure .env file:
```bash
sudo nano /root/story-telegram-bot/.env
```

Add the following content:
```env
BOT_TOKEN=your_bot_token
MONITORING_INTERVAL=300
SERVER_PORT=26657
ADMIN_ID=your_telegram_id
RPC_ENDPOINT_1=https://archive-rpc-story.josephtran.xyz/status
RPC_ENDPOINT_2=https://story-testnet-rpc.itrocket.net/status
STORY_SERVICE=story
STORY_GETH_SERVICE=story-geth
```

6. Create systemd service:
```bash
sudo nano /etc/systemd/system/story-telegram-bot.service
```

Add the following content:
```ini
[Unit]
Description=Story Telegram Bot Service
After=network.target

[Service]
ExecStart=/usr/bin/python3 /root/story-telegram-bot/bot.py
WorkingDirectory=/root/story-telegram-bot
Restart=always
User=root

[Install]
WantedBy=multi-user.target
```

7. Enable and start the service:
```bash
sudo systemctl daemon-reload
sudo systemctl enable story-telegram-bot
sudo systemctl start story-telegram-bot
```

## ⚙️ Configuration

The `.env` file supports the following parameters:

| Parameter | Description | Default |
|-----------|-------------|---------|
| BOT_TOKEN | Your Telegram bot token | Required |
| MONITORING_INTERVAL | Interval in seconds for monitoring updates | 300 |
| SERVER_PORT | Node RPC port | 26657 |
| ADMIN_ID | Your Telegram user ID | Required |
| RPC_ENDPOINT_1 | Primary RPC endpoint for height comparison | Provided |
| RPC_ENDPOINT_2 | Backup RPC endpoint | Provided |
| STORY_SERVICE | Story service name | story |
| STORY_GETH_SERVICE | Story Geth service name | story-geth |

## 🎮 Usage

1. Start a chat with your bot on Telegram
2. Send `/start` to access the main menu
3. Use the inline keyboard buttons to navigate features

## 🤖 Bot Commands

- **📊 Status:** View node synchronization status and service health
- **📜 Logs:** Access and filter service logs
- **🔄 Restart Services:** Safely restart story or story-geth services
- **💻 System Info:** Monitor system resources
- **🔍 Monitor:** Configure continuous monitoring
- **📈 Performance:** View detailed performance metrics
- **🌐 Network:** Check network statistics
- **✅ Validator:** Access validator information
- **❓ Help:** Display command information

## 🔍 Monitoring Features

The bot provides continuous monitoring with configurable intervals:

- Block height synchronization
- Disk usage
- Service status
- System resources
- Network connectivity

To manage monitoring:
1. Select "🔍 Monitor" from main menu
2. Choose "Activate Monitoring" or "Deactivate Monitoring"
3. View current monitoring status

## 🗑️ Uninstallation

### Automatic Uninstallation

Run the installation script with uninstall option:
```bash
sudo ./install.sh
# Select option 2 for uninstallation
```

### Manual Uninstallation

1. Stop and disable the service:
```bash
sudo systemctl stop story-telegram-bot
sudo systemctl disable story-telegram-bot
```

2. Remove service file:
```bash
sudo rm /etc/systemd/system/story-telegram-bot.service
```

3. Remove bot directory:
```bash
sudo rm -rf /root/story-telegram-bot
```

4. Reload systemd:
```bash
sudo systemctl daemon-reload
```

## 🔧 Troubleshooting

### Common Issues:

1. **Bot not responding:**
   ```bash
   sudo systemctl status story-telegram-bot
   sudo journalctl -u story-telegram-bot -f
   ```

2. **Permission errors:**
   - Ensure the bot is running as root
   - Check file permissions in `/root/story-telegram-bot`

3. **Configuration issues:**
   ```bash
   sudo nano /root/story-telegram-bot/.env
   sudo systemctl restart story-telegram-bot
   ```

### Service Management

- **View logs:**
  ```bash
  journalctl -u story-telegram-bot -f
  ```

- **Restart service:**
  ```bash
  sudo systemctl restart story-telegram-bot
  ```

- **Check status:**
  ```bash
  sudo systemctl status story-telegram-bot
  ```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📞 Support

- Telegram: [@zxLimon](https://t.me/zxLimon)
- GitHub Issues: [Create an issue](https://github.com/0xlimon/story-wave2-task4-Useful-utility-for-validators/issues)

---

Created with ❤️ by [0xlimon](https://github.com/0xlimon)