# Story Snapshot Web Application by Krews

This submission includes a link to a web application that provides details and CLI commands for restoring a Story blockchain node using the latest snapshots.

## Application Link
You can access the web application here: [https://krews.xyz/snapshots/story](https://krews.xyz/snapshots/story)

## Web Application Features
- User-friendly interface.
- **Pruned** and archived snapshot options.
- Setup commands.
- Users can apply their own node configurations using the custom configuration menu. In this way, they can easily advance the installation without having to make manual changes to the commands they copied.
- `Inside the snapshot` menu allows users to view the contents of the snapshot.
- The application will display the latest snapshot details, including:
   - **Story Version**
   - **Geth Version**
   - **Snapshot Date**
   - **Last Block Height (Block Number)**
   - **Pruning Mode**
   - **Size**

## How to Use the Web Application

1. **Navigate to the Application**  
   Go to the [Story Snapshot Website by Krews](https://krews.xyz/snapshots/story) in your web browser.

2. **Choose the Snapshot Type**  
   The application provides two types of snapshots:
   - **Pruned**: Contains only the most recent state of the blockchain.
   - **Archive**: Contains a complete history of the blockchain.

3. **Configure Commands (Optional)**  
   Using the custom configuration menu, you can change your Story root file or the Story and Geth daemon names according to your node configuration.

4. **Use Setup Commands**  
   Go to the setup commands section, copy the commands, and run them on your server. Setup commands will download the snapshot in the fastest way with rclone, restart your node, and check the logs.

## How Often Is the Snapshot Updated?
Snapshots are taken every four hours.
