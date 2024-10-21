# Story All-in-One (AIO) Script

 ![Story AIO Banner](https://res.cloudinary.com/ghostdigital/image/upload/v1728839692/Image_2024-10-14_3_2x_emjcnu.png)

## Overview

The Story All-in-One (AIO) Script is a comprehensive tool designed to simplify the installation, management, and operation of Story nodes. This script provides an easy-to-use interface for various tasks related to Story and Story-GETH services.

## Features

* One-click installation of Story and Story-GETH
* Service management (start, stop, check status)
* Node synchronization monitoring
* Security enhancements for your node
* Environment and wallet information checking
* AIO script management and updates

## Prerequisites

* A Linux
* Sudo privileges (for Linux)
* Internet connection

## Installation


1. Clone the repository & run with one command

   ```
   git clone https://github.com/OriginStake/story-aio.git && cd story-aio && chmod +x main.sh && ./main.sh
   ```

## Usage

Upon running the script, you'll be presented with a main menu offering various options:


1. Install Story - All-in-One Script
2. Start/Stop/Check/Remove Story Service
3. Story Tools
4. Secure Story Node
5. Check ENV & Wallet Info
6. Manage AIO Script
7. Exit

### 1. Install Story

This option guides you through the installation process of Story and Story-GETH. You can customize various settings such as installation directories, ports, and versions.

### 2. Service Management

Here you can:

* Start the Story services
* Stop the Story services
* Check the status of Story services
* Remove all Story installations

The script will also display the current sync status of your node.

### 3. Story Tools

This section provides additional tools and utilities for managing your Story node.

### 4. Secure Story Node

Enhance the security of your Story node with various options provided in this section.

### 5. Check ENV & Wallet Info

View your current environment settings and wallet information.

### 6. Manage AIO Script

Update and manage the AIO script itself.

## Configuration

The script uses environment variables stored in `$HOME/.story_env`. You can modify these variables to customize your installation.

## Service Files

The script creates systemd service files for Story and Story-GETH on Linux systems. These can be found at:

* `/etc/systemd/system/story-geth.service`
* `/etc/systemd/system/story.service`

## Logs

Installation logs are stored in `$HOME/install_log.txt`.

## Troubleshooting

If you encounter any issues:


1. Check the installation logs in `$HOME/install_log.txt`
2. Ensure all dependencies are correctly installed
3. Verify your system meets the minimum requirements
4. Check your internet connection

## Contributing

Contributions to the Story AIO Script are welcome. Please fork the repository and submit a pull request with your changes.

## Disclaimer

This script is provided as-is. Always ensure you understand the actions being performed on your system. It's recommended to run this script on a dedicated machine or VM.

## Support

For support, please open an issue on the GitHub repository or contact the OriginStake team.

Developed with ❤️ by OriginStake