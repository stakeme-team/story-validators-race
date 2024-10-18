# Story Node Installation and Management Script

## Features
1. **Animated Text Display**: Visually appealing start using figlet and lolcat.
2. **Multiple Installation and Management Options**:
   - Full node installation from scratch
   - Consensus layer snapshot download and application
   - Execution layer (Geth) snapshot download and application
   - Both consensus and execution layer snapshot application
   - Consensus node upgrade
   - Geth node upgrade
3. **Flexible Port Configuration**: Allows custom port prefix or uses default ports.
4. **Improved Error Handling**: Robust error checking and management.
5. **Step-by-Step Guided Process**: User-friendly installation and management experience.
6. **Automatic Dependency Installation**: Installs required dependencies automatically.
7. **Support for Custom Node Moniker**: Allows users to set a custom name for their node.

## How to Use

### 1. Download the script

```bash
wget https://files4.blacknodes.net/story-testnet/story-node-installer.sh
```

### 2. Make the script executable

```bash
chmod +x story-node-installer.sh
```

### 3. Run the script

```bash
./story-node-installer.sh
```

### 4. Follow the on-screen prompts
- Choose your installation or management option (1-6)
- Enter your node's moniker (name)
- Optionally, enter a custom port prefix

### 5. Automatic Process
The script will handle the rest of the process automatically, including:
- Installing dependencies
- Setting up Go (if needed)
- Downloading and installing binaries
- Initializing the node
- Creating service files
- Applying snapshots (if chosen)
- Upgrading nodes (if chosen)

### 6. View logs
After completion, you can view logs using:

For Story logs:
```bash
sudo journalctl -u story -f
```

For Geth logs:
```bash
sudo journalctl -u story-geth -f
```

## Summary
This script simplifies the process of setting up and managing a Story node, making it accessible to users with varying levels of technical expertise.
