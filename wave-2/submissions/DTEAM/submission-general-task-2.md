![story](https://github.com/user-attachments/assets/47214ed3-ef39-4223-952f-13a245934e37)
# Snapshot Management for Story Blockchain

**dteam.tech** presents a robust snapshot management feature tailored specifically for the Story blockchain, which runs on the **CometBFT consensus** with an execution layer built on **gETH**. This toolset is designed to provide seamless management of blockchain snapshots, including both **pruned** and **archive** snapshots, ensuring flexibility and efficiency in node setup and synchronization.

### Link - [https://dteam.tech/services/testnet/snapshot/story](https://dteam.tech/services/testnet/snapshot/story?type=pruned)

<br/>

## Key Features

### 1. User-Friendly Interface

Our **custom-built interface** offers a visually appealing and intuitive experience, designed with **user convenience** in mind. With clearly organized sections and dynamically updated information, users can easily navigate between different services, whether installing dependencies, managing snapshot data, or adjusting node configurations.

### 2. Seamless Switching Between Snapshot Types
![image](https://github.com/user-attachments/assets/9348f144-1bbe-4d51-82a6-471d35cd73c8)

Users can effortlessly toggle between **Pruned** and **Archive Snapshots**. Both options are displayed with real-time details such as:

- **Name**: Clear indication of the snapshot type and testnet information.
- **Height**: The current block height of the snapshot.
- **Size**: The precise size of the snapshot data in megabytes.
- **Timestamp**: Dynamic updates of when the snapshot was generated.
- **URL**: A direct link for downloading the snapshot.

This flexibility allows node operators to optimize their node setup based on their storage and synchronization needs.

#### Pruned Snapshot
A **Pruned Snapshot** provides a lightweight, faster synchronization option by removing historical blockchain data that is not required for current node operation.

#### Archive Snapshot
An **Archive Snapshot** offers a full, historical blockchain dataset, suitable for users who need to maintain complete records for validation, auditing, or custom analytics purposes.

### 3. Dynamic Snapshot Information
![image](https://github.com/user-attachments/assets/9ad43943-b6c9-4468-ba62-5c5d18d6ea59)

The snapshot section offers a dynamically updated overview of the latest available snapshots. This includes both the **Latest Pruned Snapshot** and the **Latest Archive Snapshot**, as well as past snapshots for reference, ensuring users always have access to the most current and reliable data.

### 4. Simplified Node Management

Alongside snapshot downloads, the interface provides a step-by-step guide for installing dependencies and managing node data. Key actions include:

- **Install Dependencies**;
- **Disable State Sync**;
- **Reset Node Data**.

### 5. How to use?

To get started, follow these basic steps:

- **Choose your Snapshot Type:** Navigate to the Pruned or Archive tab based on your requirements;
- **Install Dependencies:** Follow the listed commands to ensure your node environment is set up;
- **Stop nodes:** Commands for stopping the nodes;
- **Disable State Sync (if required):** Modify the config.toml file using the provided sed command;
- **Reset Node Data:** Remove the current chain data;
- **Download the Snapshot:** Copy the provided URL and download the snapshots to your nodes;
- **Restart node and check logs:** Instructions for restarting the nodes and monitoring logs to ensure successful setup.

##

The streamlined process helps you get your node up and running quickly with minimal effort.
