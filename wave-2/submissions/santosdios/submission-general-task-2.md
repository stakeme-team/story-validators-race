# Story Snapshot Web Application Guide

This submission includes a link to a web application that provides details and CLI commands for restoring a Story blockchain node using the latest snapshot.

## Application Link
You can access the web application here: [Story Snapshot Application](https://story.frontchain.cumulo.pro/snap)

## How to Use the Web Application

1. **Navigate to the Application**  
   Open the [Story Snapshot Application](https://story.frontchain.cumulo.pro/snap) in your web browser.

2. **Choose the Snapshot Type**  
   The application provides two types of snapshots:
   - **Prunned**: Contains only the most recent state of the blockchain.
   - **Archive**: Contains a complete history of the blockchain.

3. **View Snapshot Details**  
   The application will display the latest snapshot details, including:
   - **Last Updated Time (UTC)**
   - **Filename**
   - **Size**
   - **Last Block Height**

4. **Copy CLI Commands**  
   The application generates CLI commands to restore your node using the selected snapshot. Click the "Copy" button to copy these commands.

5. **Execute the Commands in Your Terminal**  
   Paste the copied commands into your terminal to perform the following actions:
   - Install necessary dependencies
   - Stop the running Story services
   - Download and extract the latest snapshot
   - Restart the Story services and monitor logs

6. **Verify the Node Status**  
   After completing the steps, you can check the node status by running:
   ```bash
   sudo systemctl status story

## Requirements
  - OS: Ubuntu 22.04 or later.
  - Permissions: Sudo privileges are needed to stop/start services and install dependencies.
