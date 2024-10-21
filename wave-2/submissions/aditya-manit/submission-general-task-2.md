# Encapsulate - Snapshots for the Story Testnet

[Encapsulate](https://encapsulate.xyz/) provides snapshots for the **Story** testnet to help users easily set up or restore their nodes. These snapshots are updated every 4 hours and are available for download along with instructions using the links below.

## Types of Snapshots

Encapsulate offers two types of snapshots for both Story and Geth:

1. **Archive Snapshot**  
   A full snapshot containing the complete blockchain history, recommended for users who need the entire network data for archival purposes.

    - **Story Archive**: [Download Link](https://encapsulate.xyz/snapshots/story-archive-testnet)
    - **Geth Archive**: [Download Link](https://encapsulate.xyz/snapshots/story-archive-testnet)

2. **Pruned Snapshot**  
   A lightweight snapshot that contains only the essential data required to run the node efficiently, optimized for saving disk space.

    - **Story Pruned**: [Download Link](https://encapsulate.xyz/snapshots/story-pruned-testnet)
    - **Geth Pruned**: [Download Link](https://encapsulate.xyz/snapshots/story-pruned-testnet)

## Availability

- Snapshots are refreshed every **4 hours** to ensure you always have the latest blockchain data.
- Use the provided download links to quickly restore your nodes with the most recent data and get up and running in no time!

## How to Use

Follow these links for step-by-step instructions on how to download and apply the snapshots to your Story or Geth node setup:

- **Story Archive Setup**: [Story Archive](https://encapsulate.xyz/snapshots/story-archive-testnet)
- **Story Pruned Setup**: [Story Pruned](https://encapsulate.xyz/snapshots/story-pruned-testnet)

## Automated Snapshot Restoration Script

We’ve created a **convenient script** that simplifies the process of downloading and applying snapshots for your Story and Geth nodes. The script:

- Prompts you to specify the **service names** for the execution and consensus layers, with default values provided.
- Allows you to **choose between pruned and archive snapshots** for both Story and Geth nodes.
- Automatically **stops the services**, **downloads and extracts the chosen snapshot**, and **restarts the services** after the restoration process is complete.

The following provides a visual guide on how to interact with the TUI-based script for setting up your Story node. You’ll be prompted to enter service names, and finally, you’ll choose the appropriate snapshot type.

### Choose Service Name
| **Enter Geth Service Name**                                   | **Enter Story Service Name**                                 |
|---------------------------------------------------------------|--------------------------------------------------------------|
| ![Enter Geth Name](https://raw.githubusercontent.com/encapsulate-xyz/story-snapshot-script/refs/heads/main/images/enter-geth-name.png) | ![Enter Story Name](https://raw.githubusercontent.com/encapsulate-xyz/story-snapshot-script/refs/heads/main/images/enter-story-name.png) |

### Select Snapshot Type
![Choose Snapshot Type](https://raw.githubusercontent.com/encapsulate-xyz/story-snapshot-script/refs/heads/main/images/choose-snapshot-type.png)

These images demonstrate the simple, interactive steps to set up and restore your Story protocol node with ease.