# Submission: General Task 2

## Overview
This solution offers a **fully automated service** for downloading **fresh archived** and **pruned snapshots** of the Story blockchain. Snapshots are updated every **6 hours**, ensuring timely access to the latest blockchain state.

We designed this service with both ease of use and efficiency in mind, making sure that anyone can download the latest snapshots with minimal effort.

---

## 🚀 Key Features

- **📅 Regular Updates**: Snapshots are generated every 6 hours, keeping your data fresh and in sync with the latest blocks.
- **🌍 Web Interface**: Easily accessible through our dedicated service at [Snapshot Story Service](https://snapshotstory.shablya.io/).
- **📜 Comprehensive Guide**: A step-by-step guide is available at [Story Node Guide](https://node.shablya.io/guide/story_guide.html) for restoring snapshots.

  
---

## 📂 Access to Snapshots

- **Web Access**: Visit our [Snapshot Story Service](https://snapshotstory.shablya.io/) for easy downloads of the latest snapshots.
- **Detailed Instructions**: Follow our comprehensive guide on the [Story Node Guide](https://node.shablya.io/guide/story_guide.html) to set up and restore snapshots quickly.

---

## 🔧 Installation & Script

If you prefer automating the snapshot download process, use the following command to update your snapshots directly from the terminal:
 **Additionally, the script I submitted in the first task also includes this functionality, ensuring seamless snapshot updates.**


```bash
wget -q -O update_snapshot.sh https://snapshotstory.shablya.io/update_snapshot.sh && sudo chmod +x update_snapshot.sh && ./update_snapshot.sh
```
This script automates the updating of snapshots for the Story blockchain, ensuring both Story and Story-geth nodes have the latest data.

1. **Dependency Check**: Installs necessary tools (`jq`, `wget`, `lz4`) if not already installed.
2. **Node Management**: Stops Story and Story-geth nodes to ensure safe updates.
3. **Backup**: Creates a backup of `priv_validator_state.json` before data replacement.
4. **Data Cleanup**: Deletes previous chaindata and story data for a fresh start.
5. **Snapshot Download**: Retrieves the latest snapshots from the public service.
6. **Decompression**: Extracts the downloaded snapshots into the appropriate directories.
7. **Restore State**: Restores the validator state from the backup.
8. **Restart Nodes**: Brings the nodes back online with the latest data.
## Full Code Access

You can find the complete and accessible code for this script at the following link: [Update Snapshot Script](https://github.com/nodesshablya/StoryProtocol_Services/blob/main/update_snapshot.sh).



## 🛠️ How It Works

- **Automated Snapshots**:  
  Our service uses a **cron job** to automatically generate new snapshots every **6 hours**. This ensures you're always working with fresh blockchain data.
- **Snapshot Download**:  
  Both archived and pruned snapshots are publicly available at [Snapshot Story Service](https://snapshotstory.shablya.io/).

## 🌐 Conclusion

Our system provides a **seamless, user-friendly** way to access and maintain fresh snapshots of the **Story blockchain**, making it easy to stay up to date. The combination of **automated scripts**, web access, and **regular updates** ensures that users can always download the latest snapshot and minimize downtime.