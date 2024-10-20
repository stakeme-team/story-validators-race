## Introduction

This guide provides instructions on how to **install**, **update**, and **monitor** a **Story Protocol** node using an interactive bash script. The script simplifies the setup process and provides an easy-to-use menu for managing your node.

## Prerequisites

Before running the script, please ensure that you meet the following prerequisites:

- **Operating System:** Ubuntu 20.04 LTS or a compatible Linux distribution.
- **User Permissions:** A user account with `sudo` privileges is required.
- **Network Requirements:**
  - **Stable Internet Connection:** Required for downloading dependencies and snapshots.
  - **Firewall Configuration:** Ensure that the necessary ports are open if you are behind a firewall. You can customize ports during installation.
- **Required Packages:**
  - `curl`: to fetch the script from the internet - script will take care of the remaining dependencies.

## How to Use

Follow the steps below to use the script for installing or managing your Story Protocol node.

### 1. Run the Script

To run the script, open your terminal and execute the following command:

```bash
curl -sL https://tecnodes.network/chains/testnet/story/script/story.sh | bash
