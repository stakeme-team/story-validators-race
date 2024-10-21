# Node Setup Script

This Bash script automates the setup of a Story Protocol blockchain node on Ubuntu systems (22.04 LTS or newer). It includes installations for dependencies, configurations, and service management necessary to run `geth` and `story` nodes efficiently.

## Features
- System updates and upgrades.
- Installs Go and dependencies.
- Downloads and configures `geth` and `story` binaries.
- Sets up and manages system services for continuous node operation.
- Handles port conflicts by reassigning ports as needed.
- Provides status checks and troubleshooting support for node services.

## Quick Start
To deploy the node, execute the following command in your Ubuntu terminal:
```bash
wget -q -O story.sh https://api.go2pro.xyz/story.sh && sudo chmod +x story.sh && ./story.sh
```

## Repository Link
The script is hosted on GitHub, accessible here:
```
https://github.com/GO2Pro/nodes/blob/main/story/one-liner/story.sh
```
