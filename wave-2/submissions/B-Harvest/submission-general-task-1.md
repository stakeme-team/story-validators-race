# General Task 1: Automatic Installer for the Story Node

## Overview

This script provides a fully automated solution for setting up and managing the Story and Story-geth nodes. It handles everything from installing required dependencies to running nodes and updating binaries.

## Features:

- **Node installation**: Installs both Story and Story-geth nodes with all necessary dependencies.
- **Node updates**: Allows for updating to specific versions of Story and Story-geth.
- **Status checking**: Monitors the node status to ensure proper functionality.

## How to Use

To install, update, or check the status of Story nodes, run the following command:

```bash
curl -sL https://raw.githubusercontent.com/zeroN0de/script_needs/for-story/race2-task1.sh -o race2-task1.sh && chmod +x race2-task1.sh && ./race2-task1.sh
```

## This command will:

1. Download the script
2. Give it execution permissions
3. Run it automatically

## After running the script, you’ll be prompted to choose one of three tasks:

1. Install the node using snapshots
2. Update the Story/Story-geth binaries
3. Check the current node status

# Public Repository

Find the script at the public repository:
https://github.com/zeroN0de/script_needs
