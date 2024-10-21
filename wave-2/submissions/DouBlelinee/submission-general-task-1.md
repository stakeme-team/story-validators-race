# General-Task 1: Automatic installer for the Story node

# ⛓️ 0xdoubleline Story Node Auto Installation Guide

This script is designed to automate the installation and management of the Story Node. It can handle installations, updates, backups, and restores of the validator key.

---

## 💡 Prerequisites

- Ensure you are running the script with root privileges. You can do this by using `sudo` or logging in as the root user.

---

## 💻 System Specs

| Component  | Requirement          |
|------------|----------------------|
| **CPU**    | 4 Cores              |
| **RAM**    | 16 GB                |
| **Disk**   | 200 GB               |
| **Bandwidth** | 25 MBit/s         |

---


## ⚙️ Installation
To install the Auto Install Story Node, execute the command below:

```
wget -q -O automatic-install-story-node.sh https://raw.githubusercontent.com/DouBlelinee/story-contribute/main/automatic-install-story-node.sh && sudo chmod +x automatic-install-story-node.sh && ./automatic-install-story-node.sh
```
---

## 🕹️ Usage
To use the script, run the following command in your terminal:


```
./automatic-install-story-node.sh

```
---

## 🪄 Features
The script provides the following functionalities:

- **1.Auto Install Story Node:** Installs the Story Node with the necessary dependencies and configurations.
- **2.Manually Upgrade:** Upgrades Story and Story-geth to the latest versions.
- **3.Export Validator Key:** Backs up the validator key to your Downloads directory.
- **4.Restore Validator Key:** Restores the validator key from the Downloads directory.
- **5.Download Snapshot:** Allows users to download a snapshot of the blockchain.
- **6.Check Block Sync Status:** Displays the current synchronization status of the node.
- **7.Check Logs:** Views the logs of the Story and Story-geth services.
- **8.Delete Story & Story-geth:** Completely removes the installed Story and Story-geth services.
- **9.Exit:** Exits the script.

---

## 📓 Notes
Ensure you have the necessary packages (curl, jq, and systemctl) installed on your system.
The script will prompt for various actions, and you can select the desired option by entering the corresponding number.

---

## 📂 Code Repository
GitHub Repository - [Auto Install Story Node](https://github.com/DouBlelinee/story-contribute)

---  

## Credits
This script utilizes code from various sources and is adapted for ease of use. Special thanks to itrocker.net  for the good snapshot service and the source of peers.