# Task 4: Useful Utilities for Validators

I used the `validator_utils.sh` script for essential node management tasks.

## Backing Up and Restoring Validator Keys

### Backing Up Keys

I backed up my validator keys using:

```
./validator_utils.sh backup-keys
```


This command backed up:
- EVM Private Key: Located at /root/.story/story/config/private_key.txt
- Tendermint Validator Key: Located at /root/.story/story/config/priv_validator_key.json

The backup was saved at: `/root/backup-keys-story/story_keys_backup.tar.gz`

### Restoring Keys

To restore keys (if needed):

```
./validator_utils.sh restore_keys
```


## Checking Node Synchronization Status

I checked my node's current block height:

```
./validator_utils.sh sync
```

## Viewing Validator Information

I got detailed information about my validator:

```
./validator_utils.sh info
```

This command provided:
- Node ID
- Moniker
- Network
- Catching Up Status

## Funding and Registering the Validator Node

1. I set up my MetaMask wallet using the private key from `/root/.story/story/config/private_key.txt`.
2. I added the Story testnet network to MetaMask via Chainlist.
3. I obtained testnet tokens from the Story Faucet.
4. I registered my node as a validator:

```
./story_node_manager.sh register
```

5. I verified my validator status on the Story Explorer.

These utilities greatly simplified the process of managing and monitoring my Story validator node.
