# Task 1: Automatic Installer for the Story Node

## System Preparation

I updated the system packages and installed the necessary dependencies:

```
sudo apt install git ansible -y

```
I verified that Ansible was installed and was version 2.15 or higher:

```
ansible --version
```


## Project Download

I cloned the updated project repository:

```
git clone https://github.com/nodemasterpro/deploy-node-story.git
cd deploy-node-story
```


## Using the Story Node Manager

I used the `story_node_manager.sh` script to install and manage the Story node:

### Installing a New Story Node


./story_node_manager.sh install <my_moniker>


This command performed the following tasks:
- Installed the Story Protocol node
- Configured the node with my specified moniker
- Downloaded and imported the latest snapshot for faster synchronization

The installation process took approximately 45 minutes due to the snapshot download and import.

### Starting Node Services and Viewing Logs

After installation, I started the node services:

```
./story_node_manager.sh start
```

I viewed the logs to ensure everything was running smoothly:

```

./story_node_manager.sh logs-consensus

./story_node_manager.sh logs-geth
```

### Checking Service Status

I ensured that the services were running correctly:

```
./story_node_manager.sh status
```

The automatic installer successfully set up my Story node, making the process straightforward and efficient.
