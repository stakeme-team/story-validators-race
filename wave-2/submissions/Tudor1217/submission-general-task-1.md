Github link: https://github.com/Tudor1217/StoryTasks/blob/main/story_node_setup.py

# 1. Save the script
nano story_node_setup.py

# 2. Make the script executable
chmod +x story_node_setup.py

# 3. To run the script, use the following command format:
Example: sudo python3 story_node_setup.py <action> [optional parameters]

Available Actions:
- "install_dependencies"          -> Install system dependencies (curl, git, wget, etc.).
- "install_go"                    -> Install Go language (default version is 1.22.8).
- "clone_and_build"               -> Clone Story and Story Geth repositories and build the binaries.
- "create_data_directories"       -> Create directories for Story and Geth data.
- "initialize_node"               -> Initialize Story node with a given moniker.
- "download_genesis"              -> Download the genesis and addrbook files.
- "configure_peers"               -> Configure peers and seeds in config.toml.
- "configure_gas_and_prometheus"  -> Enable Prometheus for monitoring in config.toml.
- "create_service"                -> Create systemd service files for Story and Geth nodes.
- "setup_snapshot"                -> Set up node synchronization with snapshots.
- "verify_logs"                   -> Verify the Story node logs using journalctl.
- "start_node"                    -> Start the Story and Geth node services.
- "stop_node"                     -> Stop the Story and Geth node services.
- "node_status"                   -> Check the status of the Story and Geth nodes.
- "update_node"                   -> Update Story node to the latest version from GitHub.
- "sync_status"                   -> Check the synchronization status of the Story node.

Optional Parameters:
- --moniker         -> Node's moniker (only required for 'initialize_node' action, default: "StoryNode").
- --story-version   -> Story repository version (used in 'clone_and_build', default: "v0.11.0").
- --geth-version    -> Story Geth repository version (used in 'clone_and_build', default: "v0.9.3").
- --go-version      -> Go language version (used in 'install_go', default: "1.22.8").

# Examples:

# 4. Install dependencies:
sudo python3 story_node_setup.py install_dependencies

# 5. Install Go (with a specific version):
sudo python3 story_node_setup.py install_go --go-version 1.22.8

# 6. Clone repositories and build binaries:
sudo python3 story_node_setup.py clone_and_build --story-version v0.11.0 --geth-version v0.9.3

# 7. Create data directories:
sudo python3 story_node_setup.py create_data_directories

# 8. Initialize the Story node with a moniker:
sudo python3 story_node_setup.py initialize_node --moniker "MyStoryNode"

# 9. Download genesis and addrbook:
sudo python3 story_node_setup.py download_genesis

# 10. Configure peers and enable Prometheus:
sudo python3 story_node_setup.py configure_peers
sudo python3 story_node_setup.py configure_gas_and_prometheus

# 11. Create systemd service files for Story and Geth nodes:
sudo python3 story_node_setup.py create_service

# 12. Set up snapshot for node synchronization:
sudo python3 story_node_setup.py setup_snapshot

# 13. Verify logs:
sudo python3 story_node_setup.py verify_logs

# 14. Start the Story and Geth nodes:
sudo python3 story_node_setup.py start_node

# 15. Stop the Story and Geth nodes:
sudo python3 story_node_setup.py stop_node

# 16. Check the node status:
sudo python3 story_node_setup.py node_status

# 17. Update the Story node:
sudo python3 story_node_setup.py update_node

# 18. Check the synchronization status:
sudo python3 story_node_setup.py sync_status

# 19. Perform a full installation sequence:
sudo python3 story_node_setup.py full_install --moniker "MyStoryNode" --story-version v0.11.0 --geth-version v0.9.4 --go-version 1.22.8
