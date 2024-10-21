




<img width="645" alt="StorySnapShot" src="https://github.com/user-attachments/assets/facce331-ac4c-46e9-bd92-1665c001ed5b">

[Telegram](https://t.me/tigernode/)<br>

* This step prepares your system for the snapshot installation by installing essential tools and ensuring that all necessary dependencies are up to date.

```
bash <(curl -s https://raw.githubusercontent.com/kaplanbitcoin1/Story/main/snapshot.sh)
```


# 🐅 KAPLAN SNAPSHOT Node Setup Menu Explanation

### Update System and Install Required Packages:

* This step updates the system’s package list and installs essential software tools needed for the node setup, ensuring that all dependencies are met for smooth operation.


### Stop Node Services:

* This function stops any running services for the Story and Geth nodes to prevent data corruption during updates and ensure that no processes interfere with the snapshot installation.

### Backup Validator State:

* A backup of the validator's current state is created. This ensures that if anything goes wrong during the snapshot process, the validator can be restored to its previous state without data loss.

### Remove Story Data:

* Old data from the Story node is deleted to clear out any outdated information. This step is crucial for ensuring that the node starts fresh with the latest snapshot data.

### Download Story Snapshot:

* The latest snapshot for the Story node is downloaded from a specified URL. This snapshot contains the most recent state of the blockchain, enabling the node to sync quickly.

### Restore Validator State:

* The validator's state is restored from the backup created earlier. This ensures continuity for the validator, allowing it to operate seamlessly with the new data from the snapshot.

### Remove Geth Data:

* Similar to the Story node, old data from the Geth node is removed. This step ensures that there are no conflicts with the new snapshot and helps maintain data integrity.

### Download Geth Snapshot:

* The latest snapshot for the Geth node is downloaded. This ensures that the Geth client is up-to-date and can operate effectively within the network.

### Download Address Book:

* The latest address book is downloaded, which contains important peer information needed for connecting to other nodes in the network, ensuring reliable communication and data sharing.

### Download Genesis File:

* The genesis file is retrieved. This file is crucial for initializing the node, as it contains the necessary data for the blockchain’s initial state.

### Configure Permanent Peers:

* The node is configured to connect to specific permanent peers. This setup helps maintain stable connections within the network, improving the node's performance and reliability.

### Configure Node:

* This step consolidates configurations, including downloading the address book and genesis file, and setting up permanent peers, streamlining the setup process for the node.

### Start Node Services:

* After completing the updates and configurations, this function restarts the Story and Geth services. This allows the nodes to operate with the newly updated data and settings.

### Exit:

* This option provides a way to exit the menu and terminate the script cleanly after the desired operations have been performed, ensuring a tidy end to the process.


![1](https://github.com/user-attachments/assets/3c1305cb-d980-49e6-afaf-6d0e594abe78)
