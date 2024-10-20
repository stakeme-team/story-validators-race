## Snapshot

This guide provides instructions on how to bootstrap the story node using a snapshot with the help of an interactive bash script.

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

Follow the steps below to use the script to install archived or pruned snapshot

### 1. Run the Script

To run the script, open your terminal and execute the following command - Select **`Options: 2`**

```bash
curl -sL https://tecnodes.network/chains/testnet/story/script/story.sh | bash
