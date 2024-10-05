# Story Validator Node Installation Guide

This guide will walk you through the process of setting up a Story validator node using the installation script provided in the [dekkeng/story-validator-node](https://github.com/dekkeng/story-validator-node) GitHub repository.

## Prerequisites

- A server or VPS with the following specifications:
  - 4 CPU cores
  - 8GB RAM
  - 200GB SSD storage
- Ubuntu 20.04 or later
- Root or sudo access to the server

## Installation Steps

1. **Update and upgrade your system**

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Install Git**

   ```bash
   sudo apt install git -y
   ```

3. **Clone the repository**

   ```bash
   git clone https://github.com/dekkeng/story-validator-node.git
   ```

4. **Navigate to the repository directory**

   ```bash
   cd story-validator-node
   ```

5. **Make the installation script executable**

   ```bash
   chmod +x install.sh
   ```

6. **Run the installation script**

   ```bash
   sudo ./install.sh
   ```

7. **Follow the on-screen prompts**

   - Enter your desired moniker (node name) when prompted.
   - Wait for the node to sync. The script will check the sync status periodically.
   - When instructed, visit the [Story Foundation Faucet](https://docs.story.foundation/docs/faucet) to request funds for your validator address.
   - Press Enter after you've received the faucet funds to continue the installation process.

8. **Save your keys**

   - The script will display your validator keys. Make sure to save these in a secure location.

9. **Verify your validator**

   - Use the validator address provided at the end of the installation to check your node status on the [Story Explorer](https://testnet.story.explorers.guru/).

## Post-Installation

After the installation is complete:

1. Monitor your validator's performance and uptime.
2. Keep your system updated regularly.
3. Join the Story Protocol community channels for announcements and support.

## Troubleshooting

If you encounter any issues during the installation:

1. Check the system requirements to ensure your server meets the minimum specifications.
2. Verify that all prerequisites are installed correctly.
3. Review the script output for any error messages.
4. If problems persist, seek help in the Story Protocol community channels or open an issue on the GitHub repository.

## Security Considerations

- Always review scripts before running them with sudo privileges.
- Secure your server by following best practices for Ubuntu server security.
- Keep your validator keys safe and never share them publicly.

## Updating

To update your Story validator node in the future:

1. Stop the existing services:
   ```bash
   sudo systemctl stop story story-geth
   ```
2. Pull the latest changes from the repository:
   ```bash
   cd story-validator-node
   git pull
   ```
3. Re-run the installation script:
   ```bash
   sudo ./install.sh
   ```
4. Follow the on-screen prompts to complete the update process.

Remember to check the [official Story Protocol documentation](https://docs.story.foundation/) for the most up-to-date information on running and maintaining a validator node.