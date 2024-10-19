# General Task 1: Story Node Installer and Manager

This guide provides step-by-step instructions to use the Story Node Installer and Manager Script. It automates the setup and maintenance of Story nodes, ensuring an easy-to-use experience for node operators.

## Script Repository

View Node Installer project at [kjnodes/story-node-configuration](https://github.com/kjnodes/story-node-configuration)

## Using the Script

Run the script using the following command in your terminal:

```bash
bash <(curl -sL https://github.com/kjnodes/story-node-configuration/raw/refs/heads/main/script.sh)
```

This will launch the interactive menu. Follow the prompts to initialize or manage your node.

![image](https://raw.githubusercontent.com/kjnodes/story-node-configuration/2ef70f9cdeb5e2e6e37b7ec1354fc1c9927d2e3a/images/main-menu.png)

## Interactive Menu Options

### Initialize service

Select option `1` to install the node and dependencies.

The script expects a default Ubuntu installation without notable modifications. It ensures the environment is configured (for example, that a Golang installation is in place), downloads latest Story binaries, and configures the system services for automatic background execution across system restarts. 

The installation stage prompts the user to enter moniker (node name) which is set up on the Story service. Additionally, snapshot type (archive or pruned) is prompted to automatically download and unpack during setup.

### Upgrade service

Choose option `2` to carry out a blockchain upgrade.

The script downloads latest Story node binary and Geth execution client binary. The consensus binary is automatically set up in Cosmovisor, while the execution binary is upgraded right away.

### Restart services

Select option `3` to restart both Story and Geth services.

This is a straight-foward helper option, considering the underlying command (`systemctl restart`) is fairly simple.

### Show service logs

Choose option `4` to observe live service logs.

Log following prompts the user for either `story` (consensus) or `geth` (execution) to view live logs for that service. We believe seeing logs real-time can provide valuable understanding of what's happening, therefore the logs are streamed by the script. Pressing `<ctrl>+C` stops this, and then gracefully returns to the main menu.

### Reset local data to pruned snapshot

Select option `5` to download the latest pruned snapshot.

Resetting a node to a pruned snapshot is helpful to keep the node data size low. The alternative to this would be pruning local data, which takes time. Furthermore we understand sometimes nodes may have issues, and especially an apphash can be tricky to deal with. To allow simple mitigation of this, the script provides an option to download latest pruned snapshot.

We do not believe there to be enough value of suggesting regularly re-downloading full archive snapshot, as it will keep growing and may be wasteful. If such a need arises later, the script may be amended.

There is an additional confirmation prompt, as to inform the user their local data will be replaced.

### Configure local monitoring solution

Select option `6` to set up local Prometheus and Grafana monitoring services.

We configure integrations to the locally installed Story node, as well as a helpful dashboard pre-installed. The Grafana service is available on local port 9999 with username `admin` and password `admin` by default.

More details about the monitoring project can be obtained at [kjnodes/story-node-monitoring](https://github.com/kjnodes/story-node-monitoring).

### Remove service and data

Select option `9` to remove all installed services and their data.

This is a destructive operation, and allows someone to do a clean installation from scratch. All binaries and service configurations are removed, as well as chain data.

Understandaly, before the option is executed, a question is prompted to the user to confirm their action, allowing the user to look back at what was entered.

### Exit

Select option `0` to exit the script.

During usual script operation, the main menu is shown after any option is completed. This allows, for example, viewing logs after initial initialization of node services.
