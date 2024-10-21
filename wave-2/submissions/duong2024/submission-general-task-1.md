## Story Node Auto-Installation Script
This script allows you to install and configure a Story node in just one click using the latest Story and Story-Geth binaries.

## One-Click Installation
To automatically install the Story node, simply run the following command:
```
source <(curl -s https://raw.githubusercontent.com/duong2024/storyprotocol/refs/heads/main/autoinstall.sh)
```
## Script Overview
The auto-installation script performs the following steps:

- Update and Upgrade VPS: Ensures your VPS is up-to-date with the latest software and security patches.
- Install Go: Downloads and installs the specified version of the Go programming language.
- Download and Install Story-Geth Binary: Fetches the latest Story-Geth binary and places it in the correct directory.
- Download and Install Story Binary: Fetches the latest Story binary for consensus and initializes the node for the Iliad network.
- Create systemd Services: Configures systemd services for both the Story-Geth and Story clients to ensure they run automatically after reboot and recover from failures.
- Start and Monitor Services: Starts the services and checks their status to confirm that the installation is successful.
- Monitor Sync Status: Optionally checks the synchronization status of the node using the Tendermint RPC API.