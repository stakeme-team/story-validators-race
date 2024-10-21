# Story Node Automatic Installer and Manager
This project automates the installation, updates, and management of the Story node using a Makefile and a shell script (story_auto.sh). The script provides options for managing the node, checking logs, initializing, and creating validators, among other functions.

# Features
Install Dependencies: Installs all necessary packages.
Download and Install Binaries: Automatically installs Story and Story-Geth binaries.
Node Initialization: Initializes a Story Iliad node with a custom moniker.
Service Management: Manages story and story-geth services via systemd.
Logs and Sync Status: Monitors logs and checks sync status.
Validator Management: Exports validator keys and creates validators.

# How to Use
Step 1: Download the Repository and Set Up
Clone the repository, navigate into the directory, and make the story_auto.sh script executable with a single command:
git clone https://github.com/winrhcp/automatic-installer-story-node.git && cd automatic-installer-story-node && chmod +x story_auto.sh

Step 2: Run the Script
Run the script to access the interactive menu:
./story_auto.sh

Step 3: Follow the Menu
The script will present a numbered menu. Choose an option by typing the corresponding number:

Install necessary dependencies
Download and install Story-Geth binary
Download and install Story binary
Initialize Story Iliad node
Create systemd services for Story and Story-Geth
Start Story and Story-Geth services
View Story-Geth logs
View Story logs
Check sync status
Check block sync progress
Export validator keys
Create validator with staked amount
Exit
For example, choose option 1 to install dependencies, or 4 to initialize the node.