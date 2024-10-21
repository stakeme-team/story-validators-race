## Story Protocol Automatic Installer
- File: [Story Installer Script](https://aldebaranode.xyz/scripts/story-installer.sh)
- GitHub: [Story Installer Repository](https://github.com/Aldebaranode/nodes-installer/blob/main/story.sh)

## How to Use
To use the Story Protocol Automatic Installer, open your terminal and run the following command:

```bash
bash <(wget -qO- https://aldebaranode.xyz/scripts/story-installer.sh)
```

The installer script offers several options for setting up the Story Protocol node. You can select from two installation methods: `systemd` and `pm2`. 

- **systemd**: This method sets up the node as a system service, ensuring it starts automatically on boot and can be managed with standard systemd commands.

- **pm2**: This method is ideal for managing the node process with the PM2 process manager, providing features like process monitoring, auto-restart, and log management.

Moreover, the installer script supports applying a snapshot to your node. This feature enables you to quickly synchronize your node with the network by downloading and applying a pre-saved state of the blockchain, significantly reducing the time needed for initial synchronization.