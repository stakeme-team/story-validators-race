
![Story-validator](https://github.com/user-attachments/assets/deaacab6-a4e1-43d3-9ebd-2be8034f3835)
# **Story Validator Node Setup Script - Documentation**

## **I. Overview**

This script automates the installation, configuration, and management of the Story Validator Node, simplifying operations by handling dependencies, binaries, system services, wallets syncing and more tasks... It provides a menu-driven interface that allows users to perform actions such as checking logs, managing node synchronization, and updating configurations...

----------

## **II. System Requirements**

1.  **OS:** Ubuntu-based distributions

2.  **Privileges:** Root or sudo access


* * * * *

## **III. Installation Guide**

### **Step 1: Script Setup**

1. Open a terminal.
4. Run the script:
`bash <(curl -s https://snapshots.tienthuattoan.com/testnet/story/install-story.sh)`
<img width="1265" alt="main" src="https://github.com/user-attachments/assets/f0699e74-55be-4813-a980-1c9c91d0d752">

----------

**NOTE:** This section provides an in-depth look at each feature available in the Story Validator Node setup script. Every feature is explained with the following structure:

-  **Feature Name and Number:** Corresponding menu option from the script.

-  **Purpose:** Describes the importance of the feature and how it benefits the user.

-  **Usage:** Step-by-step instructions on how to use the feature based on the code logic.

----------

## **IV. Main Features and Usage**

**1\. Install Story Node**

#### **Purpose:**

This feature is essential as it provides a **one-stop installation process** for the Story Validator Node. It handles everything: **dependency management, binary installation, and configuration**, ensuring your node is ready to run seamlessly in no time. This option simplifies what would otherwise be a complex multi-step process, making it accessible even to beginners.

#### **Usage:**

1. Select **"Install Story Node "** from the main menu.

2. Follow these prompts:

	- Enter a **validator name**.

	- Choose whether to **change default ports**.

	- If yes, enter new prefixes for:

	- Proxy App Port (26658)

	- RPC Port (26657)

	- P2P Port (26656)

3. The script will:

	- Install dependencies and Go.

	- Clone the Story and Geth binaries.

	- Set up the **systemd services** for automatic management.

	- Sync using the **latest snapshot**.
<img width="1413" alt="1" src="https://github.com/user-attachments/assets/c59bdeef-ea7a-46c3-a8e9-5de27fc3be10">

* * * * *

**2\. Check Story Logs**


#### **Purpose:**

This feature provides **real-time monitoring of the Story Node's logs**, which is essential for tracking your node's performance and diagnosing any issues quickly. By watching the logs, you can detect synchronization issues, service disruptions, or configuration errors as they occur.

#### **Usage:**

1. Select **"Check Story Logs"** from the menu.

2. The logs will display in real-time on the screen.

3. Use **Ctrl + C** to exit the logs view.
   
<img width="1183" alt="2" src="https://github.com/user-attachments/assets/dc71fbab-2ae7-428a-839e-43c0f06f4563">

* * * * *


**3\. Check Geth Logs**


#### **Purpose:**

This feature enables you to **monitor the Geth client logs**, which is crucial if your node interacts with Ethereum-based networks. Geth logs help ensure that your node stays connected and synced with the blockchain.

#### **Usage:**

1. Select **"Check Geth Logs"** from the menu.

2. The logs will display in real-time.

3. Use **Ctrl + C** to stop viewing the logs.
<img width="1433" alt="3" src="https://github.com/user-attachments/assets/ddb23d9e-38ec-4954-b6d8-cba540cc7d0d">

* * * * *

**4\. Check Sync Status**

#### **Purpose:**

This option checks the **current sync status** of the node, including the local and network block heights. Staying synced with the blockchain ensures the node can validate transactions and participate in consensus correctly.

#### **Usage:**

1. Select **"Check Sync Status"** from the menu.

2. The script will:

- Fetch the **local and network heights**.

- Calculate the **blocks remaining** and estimate the sync time.

3. View the sync progress on-screen.
<img width="1351" alt="4" src="https://github.com/user-attachments/assets/e3a5480f-2f2d-4595-bb6e-a54bac37cd8f">

* * * * *

**5\. Check Sync Info**


#### **Purpose:**

This feature provides **detailed synchronization information**, offering a deeper look at the node's current sync state. It is useful for debugging and ensuring your node is aligned with the blockchain.

#### **Usage:**

1. Select **"Check Sync Info"** from the menu.

2. The script will retrieve and display sync details using the RPC interface.
<img width="1146" alt="5" src="https://github.com/user-attachments/assets/57f30ade-05ff-4834-bdea-1be0bb8dd92b">

* * * * *


**6\. Check Validator Info**


#### **Purpose:**

This option displays critical information about your validator, including its **status, ID, and other relevant data**. This is essential for monitoring the health of your validator and ensuring it remains active in the network.

#### **Usage:**

1. Select **"Check Validator Info"** from the menu.

2. The validator's status will be shown on-screen.
<img width="1147" alt="6" src="https://github.com/user-attachments/assets/9b1f6540-7257-4fad-855e-b2383285d48e">

* * * * *

**7\. Synchronization via Snapshot**


#### **Purpose:**

This feature allows you to **synchronize the node using the latest snapshot**, significantly speeding up the sync process. Instead of syncing from scratch, snapshots provide a recent state of the blockchain.

#### **Usage:**

1. Select **"Synchronization via Snapshot"** from the menu.

2. Confirm synchronization by selecting **"yes"** when prompted.

3. The script will:

- Stop the services.

- Download and extract the latest snapshot.

- Restart the services for the node to continue syncing from the snapshot.
<img width="1157" alt="7" src="https://github.com/user-attachments/assets/536d5a9b-c9f0-49e9-abbd-ef212e8ad9df">

* * * * *

**8\. Update Seed**

#### **Purpose:**

This feature updates the **seed node configuration**, helping the node connect to other peers more efficiently. Keeping seeds updated ensures stable connections within the network.

#### **Usage:**

1. Select **"Update New Seed"** from the menu.

2. Enter the **new seed** in the format: `node_id@ip:port`.

3. The configuration will be updated and verified.
<img width="1174" alt="8" src="https://github.com/user-attachments/assets/b5678fae-c6ce-442c-aeef-ecdfec7680dc">

* * * * *

**9\. Sync New Live-Peers**

#### **Purpose:**

This feature fetches **live peers** from the network and updates the configuration with their details. Maintaining an up-to-date list of peers enhances connectivity and synchronization.

#### **Usage:**

1. Select **"Sync New Live-Peers"** from the menu.

2. The script will fetch live peers and update the **persistent_peers** field in the configuration.
<img width="1160" alt="9" src="https://github.com/user-attachments/assets/2278ce83-a76c-44a4-bf81-130e734cd2d7">

* * * * *

**10\. Clear Persistent Peers**


#### **Purpose:**

This option clears all existing **persistent peers** from the configuration. Use this when you encounter connectivity issues or want to reset the peer list.

#### **Usage:**

1. Select **"Clear Persistent Peers"** from the menu.

2. The script will remove the peer list from the configuration.
   
<img width="1158" alt="10" src="https://github.com/user-attachments/assets/24b74be4-af6e-4727-8829-6c92d2ba2c1e">

* * * * *


**11\. Check Story Version**


#### **Purpose:**

Displays the **current version of the Story Node and Geth**. This helps ensure you are using the latest version for compatibility and security.

####**Usage:**

1. Select **"Check Story Version"** from the menu.

2. View the versions displayed on-screen.
<img width="1144" alt="11" src="https://github.com/user-attachments/assets/535f9a65-b4a6-4bf4-8a99-2ac427b4cf6d">

* * * * *


**12\. Upgrade Story Version**


#### **Purpose:**

This option upgrades the Story binaries to the **latest version**, ensuring your node remains compatible with the network's latest updates.

#### **Usage:**

1. Select **"Upgrade Story Version"** from the menu.

2. The script will download and install the latest binaries.
<img width="1178" alt="12" src="https://github.com/user-attachments/assets/bdddded3-899c-4f0b-ac50-a717162c4e26">

* * * * *

**13\. Create Wallet**


#### **Purpose:**

Creates a **new wallet** for your node and exports the private key. This wallet is essential for validator operations.

#### **Usage:**

1. Select **"Create Wallet"** from the menu.

2. Enter the **wallet name** when prompted.

3.  **Save the private key** securely when displayed.
<img width="1179" alt="13" src="https://github.com/user-attachments/assets/05673ed7-b86e-487a-878e-94738d250de3">

* * * * *

**14\. Check Wallet Info**


#### **Purpose:**

Displays information about the wallet you have created, including essential details for managing your assets.

#### **Usage:**

1. Select **"Check Wallet Info"** from the menu.

2. The wallet details will be shown on-screen.
<img width="1165" alt="14" src="https://github.com/user-attachments/assets/052fc209-815d-4071-8c89-a2f57f6149a3">

* * * * *

**15\. Check Wallet Balance**


#### **Purpose:**

This option allows you to **check the wallet's balance** using an EVM address.

#### **Usage:**

1. Select **"Check Wallet Balance"** from the menu.

2. Enter the **EVM address** when prompted.

3. View the balance in ETH format.
<img width="1193" alt="15" src="https://github.com/user-attachments/assets/8f4969fb-13fd-46a5-a9c8-24b46806a6a5">

* * * * *

**16\. Restart Story Node**


#### **Purpose:**

Restarts the **Story and Geth services**, useful after making configuration changes or encountering issues.

#### **Usage:**

1. Select **"Restart Story Node"** from the menu.

2. The services will restart, and logs will be displayed.
<img width="1154" alt="16" src="https://github.com/user-attachments/assets/669fdd02-e85c-4ad9-b378-ea8bafe98bad">

* * * * *

**17\. Stop Story Node**

#### **Purpose:**

Stops the Story and Geth services when maintenance or updates are needed.

#### **Usage:**

1. Select **"Stop Story Node"** from the menu.

2. The services will be stopped.
<img width="1180" alt="17" src="https://github.com/user-attachments/assets/5fd0f0d0-c49d-446d-a389-3fe1d8f50e1e">

* * * * *

**18\. Delete Story Node**

#### **Purpose:**

This option **removes the node and all its data**, useful if you need to reconfigure or uninstall the node.

#### **Usage:**

1. Select **"Delete Story Node"** from the menu.

2. Confirm deletion by typing **"yes"**.
<img width="1178" alt="18" src="https://github.com/user-attachments/assets/e7eca5c0-fa23-45ab-ad3d-63fa738e00b9">

* * * * *

**19\. Help**

#### **Purpose:**

Displays a **detailed help menu** with descriptions of all features, guiding users through the available options.

#### **Usage:**

1. Select **"Help"** from the menu.

2. Browse the help content displayed on-screen.
<img width="1186" alt="19" src="https://github.com/user-attachments/assets/87dc445d-a62b-4b0c-ac36-561823446fdf">

* * * * *

**20\. Exit**

 **Purpose:**

Exit the script safely.

 **Usage:**

1. Select **"Exit"** from the menu.

2. The script will close.
<img width="1148" alt="20" src="https://github.com/user-attachments/assets/961aad1e-4b6e-40ff-b858-8fb2df3025f4">

* * * * *

**Conclusion**

--------------

The Story Validator Node script streamlines the entire process of managing a blockchain node. With automated installation, real-time monitoring, and synchronization capabilities, it ensures that users can focus on efficiently operating their validator. This comprehensive documentation serves as a guide to harness the full potential of the script and maintain a healthy, functional node within the network. This script is developed by the DevOps team at TTT Labs, and we offer many additional tools to help make operating your Story Validator even easier.
