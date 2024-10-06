![contributions](https://github.com/user-attachments/assets/01ca1596-ef9f-4def-9f65-e8978b96a338)
# ITRocket Snapshots + AutoSnap
## Snapshots 
We offer **2 pruned and 1 archive** snapshots, each of them hosted on a separate server for optimal performance.
- All snapshots are _**available 24/7**_, as we store the last 2 snapshots.
- Snapshot size, height, and time created, as well as _**real-time number of blocks left to sync**_ (upd every 10s) are displayed.

🔗 Pruned snapshots (2 servers): https://itrocket.net/services/testnet/story/#snap  
🔗 Archive snapshot: https://itrocket.net/services/testnet/story/#snapshot-archive

## AutoSnap
Also, we've developed **AutoSnap - a tool to simplify and speed up snapshot selection and download**, offering both pruned and archival snapshots across 3 servers: https://itrocket.net/services/testnet/story/#auto-snapshot

:bulb: **One-liner to run the script:**
~~~
source <(curl -s https://itrocket.net/api/testnet/story/autosnap/)
~~~

### **AutoSnap Functionality**
- Installs all necessary dependencies.
- ***Displays available snapshots*** from our servers ***with key details***, such as height, time created, blocks ago, size, snap type (pruned/archival)
- Calculates ***estimated download time*** for each snapshot.
- Downloads the selected snapshot (2 pruned, 1 archive).
- Displays ***real-time node sync status*** after installation.
- Handles errors and provides action suggestions to the user if issues arise.
