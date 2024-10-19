# General Task 4: Utility 1: Story Node Monitoring stack

As described in General Task 3, we have built a [Story Node Monitoring stack](https://github.com/kjnodes/story-node-monitoring#readme). This was developed beyond the original requirements of Task 3, and includes a complete monitoring stack of Prometheus+Grafana+Alertmanager along with a comprehensive guide on configuration. The stack provides out-of-the box support for Telegram alerting on important events.

We additionally extended General Task 1, and provide the configuration as a straight-forward process for users that want to monitor a local node -- instead of having a separate monitoring infrastructure.

# General Task 4: Utility 2: RPC Scanner (Story RPC Node discovery)

We have built and we operate an RPC Scanner integrated into the Story protocol, available at https://services.kjnodes.com/testnet/story/public-rpc/. This tool allows discovering Story RPC Nodes exposed publicly on the Story network. The list collected has various use-cases.

Notably, RPC nodes are an important developer tool, for testing integration scenarios. A range of nodes to integrate with allows seeing various behaviors in the wild. Such nodes can also be used for data collection purposes.

The list also serves as a helpful means of discovering nodes that are exposed while having reported voting power. This should not be generally done, as nodes with voting power should have restricted access.

![image](https://github.com/user-attachments/assets/b6fa06d3-e3db-4235-89a1-63f2c3e9f02f)
