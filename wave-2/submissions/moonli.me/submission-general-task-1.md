<h1>User Guide for Story Node Installation and Management Script</h1>
<h2></h2>
<h2>Overview</h2>
<p>This Bash script automates the installation, configuration, and management of a Story node and its accompanying Story Geth client. The script provides options to download necessary dependencies, build the binaries, set up services, and manage the node lifecycle via a simple menu system. It also includes functions for snapshot downloads, status checking, and log viewing.</p>
<h2></h2>
<h2>Features</h2>
<ul>
<li><strong>Dependency Installation</strong>: Automatically installs Go, Git, and other required tools.</li>
<li><strong>Node Installation</strong>: Downloads and builds the Story and Story-Geth binaries.</li>
<li><strong>Service Setup</strong>: Configures systemd services for Story and Story-Geth.</li>
<li><strong>Snapshot Management</strong>: Downloads and applies blockchain snapshots for fast synchronization.</li>
<li><strong>Node Monitoring</strong>: Provides the ability to check node status and view logs.</li>
<li><strong>Service Control</strong>: Start, stop, and restart Story and Geth services with ease.</li>
</ul>
<h2></h2>
<h2>Prerequisites</h2>
<ul>
<li>Ubuntu-based system.</li>
<li>Root or sudo access.</li>
</ul>
<h2>To Run the Script</h2>

```
wget https://raw.githubusercontent.com/y3v63n/StoryRace/refs/heads/main/wave2/task1/story_nms.sh && chmod +x story_nms.sh

./story_nms.sh
```

<h2>Script Instructions</h2>
<h3>Step 1: Install Dependencies</h3>
<p>Run the script and select option 1 from the menu to install all necessary dependencies, including Go, Git, and other required packages.</p>
<h3></h3>
<h3>Step 2: Install Story Node</h3>
<p>Select option 2 from the menu to install the Story node. The script will:</p>
<ul>
<li>Prompt you to select a Story version and a Geth version.</li>
<li>Download, build, and install the selected versions.</li>
<li>Initialize the node with a moniker.</li>
<li>Add seed nodes to ensure the node can communicate with the network.</li>
<li>Download and extract the latest snapshot for faster synchronization. The code is authored by <a href="https://itrocket.net/api/testnet/story/autosnap/">ITRocket</a> and slightly modified by us.</li>
</ul>
<h3></h3>
<h3>Step 3: Setup Systemd Services</h3>
<p>Select option 3 from the menu to create and start systemd services for both Story and Story-Geth. This step ensures that your node runs in the background and restarts automatically if the system reboots.</p>
<h3></h3>
<h3>Step 4: Monitor Node Status</h3>
<p>Select option 4 to check the status of the Story node. The script will display the current block height and whether the node is catching up to the network. It will compare your local node height to the latest block on two remote RPC nodes.</p>
<h3></h3>
<h3>Step 5: View Logs</h3>
<p>You can view real-time logs for both the Story Geth and Story services using options 5 and 6. These logs provide insight into the node&#39;s operation and help troubleshoot issues.</p>
<h3></h3>
<h3>Step 6: Manage Services</h3>
<p>Use options 7, 8, 9, and 10 to stop, restart, or start the Story and Geth services.</p>
<h3></h3>
<h3>Step 7: Remove Node</h3>
<p>If you need to remove the node and all associated services, select option 11. This will:</p>
<ul>
<li>Stop and disable the services.</li>
<li>Remove the binaries and configuration files.</li>
<li>Clean up all data from your system.</li>
</ul>
<h3></h3>
<h3>Step 8: Exit</h3>
<p>Select option 12 to exit the script.</p>
<h2></h2>
<h2></h2>
