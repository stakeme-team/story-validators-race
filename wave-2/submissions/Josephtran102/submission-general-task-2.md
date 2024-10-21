# Wave-2: story-validators-race
<img src="https://raw.githubusercontent.com/Josephtran102/story-wave2-task2-Snapshot/refs/heads/main/assets/story-wave2-banner-04.png" style="width: 100%; height: 100%; object-fit: cover;" />

# Task 2: Service for providing archive & prunned snapshots

# Introduction

- This guide explains how to use the Story Node Snapshot Downloader, a part of the comprehensive Story Node Manager. This tool allows users to easily download and install both pruned and archive snapshots for their Story nodes, significantly reducing synchronization time.

- Snapshot service Website: [https://service.josephtran.xyz/testnet/story/snapshot/]

<img src="https://raw.githubusercontent.com/Josephtran102/story-wave2-task2-Snapshot/refs/heads/main/assets/webdownload-snap.png" style="width: 100%; height: 100%; object-fit: cover;" />

# Features

- Download and install both pruned and archive snapshots
- Choose between recommended snapshots or custom URLs
- Automatic node stopping and restarting during the process
- Backup and restore of critical node data

# Installation

To use the Story Node Snapshot Downloader, run the following command in your terminal:

```bash
bash <(curl -s https://story.josephtran.co/scripts/story-download-snapshot.sh)
```

# Menu Options
When you run the script, you'll see the following menu:
```
=== Download Latest Snapshot | J•Node | www.josephtran.xyz ===
Use arrow keys to navigate, Enter to select, or type the number of your choice.

1. Install tools: wget lz4 aria2 pv
2. Choose download source
3. Back to main menu
```

<img src="https://raw.githubusercontent.com/Josephtran102/story-wave2-task2-Snapshot/refs/heads/main/assets/06-snapshot.png" style="width: 100%; height: 100%; object-fit: cover;" />

## 1. Install tools:
`wget lz4 aria2 pv`
This option installs the necessary tools for downloading and processing snapshots. It's recommended to run this first if you haven't installed these tools before.

## 2. Choose download source

This option allows you to select the source for your snapshots:
```
Choose Download Source:
1. Download from JosephTran (recommended)
2. Input custom snapshot URLs
3. Back
```
<img src="https://raw.githubusercontent.com/Josephtran102/story-wave2-task2-Snapshot/refs/heads/main/assets/source-snapshot.png" style="width: 100%; height: 100%; object-fit: cover;" />

- Download from JosephTran (recommended)
- This option uses pre-configured URLs for both Story and Geth snapshots. These snapshots are regularly updated and tested for compatibility.
- Input custom snapshot URLs
- This option allows you to input custom URLs for both the Story and Geth snapshots. This is useful if you have access to other snapshot sources or want to use a specific version.

<img src="https://raw.githubusercontent.com/Josephtran102/story-wave2-task2-Snapshot/refs/heads/main/assets/download-snapshot.png" style="width: 100%; height: 100%; object-fit: cover;" />

## 3. Back to main menu
Returns to the main Story Node Manager menu.

# Snapshot Download Process

- The script will stop your Story node.
- It will download the selected snapshots (Story and Geth).
- Your current priv_validator_state.json will be backed up.
- Old node data will be removed.
- New snapshots will be decompressed and installed.
- Your priv_validator_state.json will be restored.
- The Story node will be restarted.

## Web Service for Snapshots

For more detailed information about our snapshot service, including the frequency of updates and the difference from the latest block in the blockchain, please visit our website:
[https://service.josephtran.xyz/testnet/story/snapshot/]

Our web service provides:

- Regular updates of both pruned and archive snapshots
- Detailed instructions on how to use the snapshots
- Information about snapshot sizes and synchronization times

## 📫 If you need any help. Please contact to me:

[![Website](https://img.shields.io/badge/Website-3b5998?style=for-the-badge&logo=google-chrome&logoColor=white)](https://service.josephtran.xyz/)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://x.com/josephtran102)
[![telegram](https://img.shields.io/badge/telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/josephtran)
[![discord](https://img.shields.io/badge/discord-7289DA?style=for-the-badge&logo=discord&logoColor=white)](https://discordapp.com/users/597430737440079883)

Thank you for using the Story Node Snapshot Downloader!
