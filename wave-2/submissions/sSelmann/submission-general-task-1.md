
# StoryCLI by Krews

This CLI was created by Krews in `Go` to automate the installation and management of Story nodes. It allows you to easily install, configure, and maintain Story nodes, providing a streamlined and efficient setup process with memorable, user-friendly commands.

### Installation

You can easily install the CLI by running the following command:

```bash
sudo -v ; curl https://krews-eu.krews-storage.xyz/install.sh | sudo bash
```

### Usage

```bash
scli [command]
```
example:
```bash
# Setup a story node
scli setup node
```

You can check the CLI commands by visiting the [StoryCLI GitHub page](https://github.com/sSelmann/storycli?tab=readme-ov-file).

### Prerequisites

Ensure that Go is installed before running the installation script. The installation script will automatically install Go if it is not already present. To verify your Go installation:

```bash
go version >= 1.20
```
```bash
Ubuntu Version >= 20.04
```

---

## Features

StoryCLI offers a variety of features that help you set up and manage your Story node efficiently. Here's a breakdown of what each menu item can do:

### 1. Install Node
- **System Check**: Verifies CPU, RAM, and disk space for compatibility.
- **Dependency Management**: Installs Go and necessary libraries.
- **Node Setup**: Downloads and installs Story and Geth binaries, initializing the node on the Iliad network.
- **Configuration**: Configures with default settings, seeds, and peers.
- **Service Setup**: Sets up systemd services to run Story and Geth in the background.

### 2. Install Snapshot
- **Snapshot Options**: Provides “Pruned” or “Archive” snapshot choices to speed up synchronization.
- **Automatic Backup**: Backs up `priv_validator_state.json` before extracting the snapshot, and restores it afterward.
- **Service Restart**: Automatically restarts services to resume node operation.

### 3. Update Node
- **Automated Updates**: Downloads and installs the latest Story and Geth binaries.
- **Restart Services**: Applies updates by restarting node services.

### 4. Node Operations
- **Show Configurations**: Displays current node configurations.
- **Set Configurations**: Allows setting or changing node configurations.

### 5. Service Operations
- **Check Logs**: View real-time logs for both Story and Geth services.
- **Stop Service**: Stops node services.
- **Restart Service**: Restarts node services.
- **Service Status**: Displays the current status of services.

### 6. View Logs
- **Log Monitoring**: Displays logs for Story or Geth services to track node activity.

---

Note: The CLI will continue to be improved to serve users in a fully automated way. Visit the [StoryCli GitHub repository](https://github.com/sSelmann/storycli) for more information and to see new features not currently available here.
