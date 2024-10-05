# Story Validator Utility Guide

This guide will walk you through the process of setting up and using the Story Validator Utility script. This utility provides various functions to monitor and manage your Story validator node.

## Prerequisites

- Python 3.7 or higher
- pip (Python package installer)
- Git

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/dekkeng/story-validator-node.git
   cd story-validator-node
   ```

2. Install the required Python packages:
   ```
   pip install requests tabulate colorama
   ```

## Usage

The utility script (`utility.py`) provides several actions to monitor different aspects of your Story validator node. Here's how to use it:

### Basic Syntax

```
python utility.py [--rpc RPC_URL] [--action ACTION]
```

- `--rpc`: The RPC endpoint URL of your Story node. Default is "http://localhost:26657".
- `--action`: The specific action to perform. Options are "health", "node", "validators", "peers", "block", "sync". Default is "health".

### Available Actions

1. **Health Check**
   Runs a comprehensive health check including node info, sync status, latest block, validators, and peers.
   ```
   python utility.py --action health
   ```

2. **Node Information**
   Displays basic information about your node.
   ```
   python utility.py --action node
   ```

3. **Validators List**
   Shows the current list of validators.
   ```
   python utility.py --action validators
   ```

4. **Peer Connections**
   Displays a list of connected peers.
   ```
   python utility.py --action peers
   ```

5. **Latest Block Information**
   Shows details about the most recent block.
   ```
   python utility.py --action block
   ```

6. **Syncing Status**
   Checks if your node is currently syncing with the network.
   ```
   python utility.py --action sync
   ```

### Examples

1. Run a health check on a local node:
   ```
   python utility.py --action health
   ```

2. Check node information for a remote node:
   ```
   python utility.py --rpc http://example.com:26657 --action node
   ```

3. View the list of validators:
   ```
   python utility.py --action validators
   ```

## Troubleshooting

If you encounter any issues:

1. Ensure your Story node is running and accessible.
2. Check that the RPC endpoint is correct and accessible from your machine.
3. Verify that you have installed all required Python packages.
4. If you get a "Connection refused" error, make sure your node's RPC server is configured to accept connections from your IP address.

## Security Considerations

- Be cautious when using remote RPC endpoints, especially with non-encrypted connections.
- Avoid exposing your node's RPC endpoint to the public internet without proper security measures.
- Consider using a reverse proxy or firewall to restrict access to your node's RPC endpoint.

## Customization

You can modify the `utility.py` script to add more features or customize existing ones. Some ideas for extensions:

- Add more detailed error handling and reporting.
- Implement a watch mode that periodically updates the information.
- Add the ability to compare data across multiple nodes.
- Incorporate alerting functionality for critical metrics.

Remember to check for updates to the utility script regularly, as new features or improvements may be added over time.