# Task 3: Grafana Dashboard for Story Validator by Nesso

## Overview

This repository provides a **Grafana dashboard** specifically designed to track essential statistics for a **Story Validator**. The dashboard offers insightful metrics to monitor and maintain optimal performance for the validator node.

## Installation Guide

To install and configure the **Grafana dashboard** for the Story Validator, execute the following command in your terminal:

```bash
cd $HOME && wget -q -O installer_grafana_story.sh https://raw.githubusercontent.com/NESSO4928/Story-Validator-Grafana/refs/heads/main/installer_grafana_story.sh && chmod +x installer_grafana_story.sh && ./installer_grafana_story.sh
```

This command will:
1. Download the installation script.
2. Set the necessary permissions.
3. Install and configure the Grafana dashboard automatically.

Once the installation is complete, you will have access to a fully functional dashboard, providing critical metrics for monitoring your Story Validator.

## Metrics Included

- **Block Height**: Monitor the current height of the blockchain.
- **Total Transactions**: Track the total number of transactions processed in the network.
- **Average Block Time**: Measure the average time taken to generate a new block.
- **Bonded Tokens**: Display the number of tokens staked by the validator.
- **Validators Status**: Show the status of validators (active, missed, byzantine).
- **Voting Power**: Monitor the voting power of validators in the network.
- **Block Size**: Track the size of each block in bytes.
- **Network Input/Output**: Measure total incoming and outgoing network traffic.
- **Connected Peers**: Display the number of active peers connected to the validator.
- **Unconfirmed Transactions**: Track the number of transactions waiting for confirmation in the mempool.
- **Failed Transactions**: Show the number of transactions that failed to process.
- **Recheck Times**: Measure how many times transactions were rechecked before being included in a block.


Source Repository - https://github.com/NESSO4928/Story-Validator-Grafana/tree/main
