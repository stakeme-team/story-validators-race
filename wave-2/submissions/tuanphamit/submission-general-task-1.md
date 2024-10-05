This script provides a set of tools to manage and monitor a Story validator node. Below is a brief explanation of each functionality in the script:

### How to Use:
- Run the script in your terminal: 

```
bash <(curl -s https://raw.githubusercontent.com/phamnhungoctuan/story-tools/main/story.sh)
```

- Select the desired option by entering the corresponding number.
- Follow any additional prompts for configuration (e.g., entering your private key, moniker, etc.).
- General Requirements:
- Make sure you have root or sudo privileges as the script installs and manages systemd services.
- Ensure that curl, jq, and wget are installed to fetch data from the internet.
  
# Menu Options:

### Install Story Node:

- Allows you to install Story node from the latest or second-latest available version.
- You will download, extract, and configure the Story Consensus and Story Geth binaries.
- You’ll set up systemd service files to manage the Story Consensus and Story Geth services.

### Update Story Consensus:

- Compares your installed Story Consensus version with the latest available one.
- Provides an option to stop the service, remove the current binary, and install the latest version.
### Update Story Geth:

- Similar to updating Story Consensus, but for the Story Geth client.
- Stops the service, installs the latest Story Geth binary, and restarts the service.

### Create Validator:

- Stakes 0.5 IP to your validator. You must have enough balance in your wallet.
- It requires you to input your private key securely for the staking process.
### Get Latest Block Height:

- Displays the current block height of the blockchain, fetched from the local Story node.
- Get Validator Dashboard Link:

- Retrieves the validator's public address and constructs a link to your validator’s dashboard on the explorer.
- Get Validator Public and Private Key:

Exports your validator's private key for EVM usage and prints it.
### Get Faucet:

- Provides a link to the Story testnet faucet where you can get test tokens.
### Additional Feature:
- System Resource Check:
- The script verifies if the system meets minimum hardware requirements:

```
CPU: 4 Cores
RAM: 16 GB
Disk Space: 200 GB
```

