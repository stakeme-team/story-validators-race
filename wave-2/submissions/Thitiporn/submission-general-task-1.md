install 1 Line

curl -s https://raw.githubusercontent.com/RohanX148R/StoryProtocol/blob/main/install_node_Story.sh | bash

wait for input MOniker name press Enter to fish


install 1 Line Snapshot
curl -s https://raw.githubusercontent.com/RohanX148R/StoryProtocol/blob/main/install_Snapshot.sh | bash

wait fo finish


To create a Validator and stake some $IP tokens, you can follow these steps. Make sure you have at least 5 $IP tokens before proceeding.

1. Preparation
Before creating a Validator, you should export important keys like the EVM key and Public Key and back up essential information:

Export Validator Key and EVM Key

# Export Validator key and EVM key to a file named .env

command :     story validator export --export-evm-key --evm-key-path .env

This command will generate and export the necessary keys for your validator. Make sure to store the Compressed Public Key (base64) for later use.

Export Public Key

# Export Public Key
command :      story validator export

Save the Compressed Public Key (base64) for later use when creating your validator.

Export Private Key for Wallet Import (Optional)
If you need to import the private key into other wallets, you can use the following command:

# Export the EVM private key
command :    story validator export --export-evm-key


2. Create a Validator
Once you have exported and backed up the necessary keys, you can proceed to create your validator:

# Create Validator with 1 stake (denoted in wei for 1 $IP token)
command :    story validator create --stake 1000000000000000000


This will create your validator with 1 $IP staked. You can adjust the stake amount as needed.

Make sure the node is running and synced before executing these commands to successfully create your validator.









