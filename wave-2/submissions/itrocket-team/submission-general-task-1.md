![autoinstall_for_story](https://github.com/user-attachments/assets/4fdc6de0-6849-4a75-8644-7a6644e8c43d)
# ITRocket Automatic Installer with Multi-Functionality

>The tool provides a **fully automated solution** for setting up and maintaining your Story node. It also has additional features such as snapshot selection (pruned or archival) and download, manual and automatic upgrade, custom port configuration, node removal, sync status and logs check.

One-liner to run the installer:
~~~
source <(curl -s https://itrocket.net/api/testnet/story/story-autoinstall/)
~~~
---
## **Functionality**  
### **1. Automatic Installation** ⚡
- **Installs Story and Story-Geth** with all necessary dependencies.
- **Configures moniker, ports**, and network settings for the node.
- **Uses AutoSnap** for snapshot installation, offering pruned and archival snapshots from multiple servers.
- **Monitors node sync** in real-time after installation, providing feedback and handling errors.
- **Ensures auto-start** of services for uninterrupted node operation.

### 2. **Manual Update** 🔄 
- Updates `Story` and `Story-Geth` to the latest available versions.

### 3. **Automatic Upgrade** 🚀
- Node is automatically upgraded as soon as an upgrade height is reached, reducing manual intervention.
- `Estimated time remaining`, `upgrade height`, and `node height` are displayed in real-time.

### 4. **Download Snapshot with AutoSnap** 📥
- Displays available snapshots from our servers with key details, such as height, time created, blocks ago, size, snap type (pruned/archival)
- Calculates `estimated download time` for each snapshot.
- Downloads the selected snapshot from `2 pruned` and `2 archival` options.

### 5. **Sync Story with State Sync** ⏳
Uses State Sync to get Story node synchronized.  

### 6. **Check Sync Status** 📈
- Provides your node’s sync status in real-time.  
- Displays node height, network height, and blocks remaining to sync every 5 seconds.  

### 7. **View Logs** 📜
Displays live logs for both Story and Story-Geth services.  

### 8. **Enable p2p Ports** 🔓
Opens the necessary peer-to-peer ports for Geth and Story nodes.  

### 9. Delete Story & Story-geth 🗑️
Backups validator data, stops and removes node.

### 💫 **Handles Service File Names** 
If the default service names for Story or Story-Geth are not found, the script prompts the user to provide `custom service names`. This applies to:
  - Manual upgrade
  - Snapshot download
  - Viewing logs
  - Deleting node

---

## Links to scripts/repos used in Installer:
🔗 **Main script** (located on our website): https://itrocket.net/api/testnet/story/story-autoinstall/  
🔗 **AutoSnap** script (also located on our website): https://itrocket.net/api/testnet/story/autosnap/  
🔗 **Autoupgrade** script: https://github.com/itrocket-team/testnet_guides/blob/main/utils/autoupgrade/upgrade.sh  
🔗 **Design functions**: https://github.com/itrocket-team/testnet_guides/blob/main/utils/common.sh
