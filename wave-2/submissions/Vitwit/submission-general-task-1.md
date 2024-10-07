# Story Node Setup Script

This script automates the installation and setup of a Story node using Go and Story-Geth on a Linux system. It configures necessary dependencies, sets up the Go environment, and creates systemd services for both Story and Story-Geth clients.

## Prerequisites

- A Linux-based system (Ubuntu preferred).
- Sudo access to install packages and create services.
- Basic knowledge of command-line operations.

## Features

- Installs required dependencies for Go and Story.
- Downloads and installs the specified versions of Story and Story-Geth.
- Initializes a Story node with a custom moniker name.
- Configures systemd services to manage the Story and Story-Geth clients.
- Updates the peers in the Story configuration file.
- Checks the synchronization status of the Story node.

## Getting Started

## Installation

To install and run the Story Node in one command, execute:

```bash
wget https://raw.githubusercontent.com/shubh7791/story-node-setup/refs/heads/main/story-node-installer.sh && chmod +x story-node-installer.sh && bash story-node-installer.sh
```
