# Story Snapshot Web Application by Krews

This submission includes a link to a web application that provides details and CLI commands for restoring a Story blockchain node using the latest snapshots.

## Application Link
You can access the web application here: [https://krews.xyz/snapshots/story](https://krews.xyz/snapshots/story)

## How to Use the Web Application

1. **Navigate to the Application**  
   Go to the [Story Snapshot Website by Krews](https://krews.xyz/snapshots/story) in your web browser.

2. **Choose the Snapshot Type**  
   The application provides two types of snapshots:
   - **Prunned**: Contains only the most recent state of the blockchain.
   - **Archive**: Contains a complete history of the blockchain.

3. **View Snapshot Details**  
   The application will display the latest snapshot details, including:
   - **Story Version**
   - **Geth Version**
   - **Snapshot Date**
   - **Last Block Height (Block Number)**
   - **Pruning Mode**
   - **Size**

4. **Use Setup Commands**  
   Go to the setup commands section and copy the commands respectively and run them on your server. Setup commands will download the snapshot in the fastest way with rclone and restart your node and check the logs.

## How often is the snapshot updated?
   snapshots is taken every two hours.
