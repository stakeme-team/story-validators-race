![contributions](https://github.com/user-attachments/assets/01ca1596-ef9f-4def-9f65-e8978b96a338)
# ITRocket Snapshots + AutoSnap
## Snapshots 
We offer **2 pruned and 2 archive** snapshots, each of them hosted on a separate server for optimal performance.
- All snapshots are _**available 24/7**_, as we store the last 2 snapshots.
- Snapshot size, height, and time created, as well as _**real-time number of blocks left to sync**_ (upd every 10s) are displayed.
- Our website lets you easily _**switch between snapshots**_ and choose the right one, or use the _**AutoSnap tool**_.
- Every server has _**monitoring**_, and snapshots are created **_automatically_** by a script that _**tracks node and network status**_.
- A pre-upgrade snapshot is automatically saved as a _**backup before each update**_, and a post-upgrade snapshot is created _**right after**_.

🔗 Pruned snapshots (2 servers): https://itrocket.net/services/testnet/story/#snap  
🔗 Archive snapshot (2 servers): https://itrocket.net/services/testnet/story/#snapshot-archive

## AutoSnap
Also, we've developed **AutoSnap - a tool to simplify and speed up snapshot selection and download**, offering both pruned and archival snapshots across 4 servers: https://itrocket.net/services/testnet/story/#auto-snapshot

:bulb: **One-liner to run the script:**
~~~
source <(curl -s https://itrocket.net/api/testnet/story/autosnap/)
~~~

### **AutoSnap Functionality**
- Installs all necessary dependencies.
- ***Displays available snapshots*** from our servers ***with key details***, such as height, time created, blocks ago, size, snap type (pruned/archival)
- Calculates ***estimated download time*** for each snapshot.
- Downloads the selected snapshot (2 pruned, 2 archival).
- Displays ***real-time node sync status*** after installation.
- Handles errors and provides action suggestions to the user if issues arise.
