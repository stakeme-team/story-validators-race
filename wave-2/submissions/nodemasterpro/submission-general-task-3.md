# Task 3: Providing a Grafana Dashboard

I set up a Grafana dashboard to monitor my node's performance:

```
ansible-playbook install_grafana_prometheus.yml
```


This script performed the following:
- Installed Grafana and Prometheus
- Activated metrics collection on the story-consensus node
- Configured a Grafana dashboard with key metrics

## Accessing the Grafana Dashboard

I accessed the Grafana dashboard via my server's IP address on port 3000:

```
http://<my_server_ip>:3000
```
Login Credentials:
- Username: admin
- Password: admin (changed upon first login)


## Important Metrics Monitored

The dashboard includes the following crucial metrics:

1. Block Height: Confirms my node is properly syncing with the network.
2. Number of Peers (num peers): Indicates network connectivity and stability.
3. Memory Usage (go_memstats_heap_alloc): Helps ensure the node isn't consuming excessive memory.
4. Missed Blocks: Critical for maintaining validator performance and reputation.
5. CPU Usage: Helps identify performance bottlenecks or resource constraints.

These metrics provide insights into my node's health and performance, allowing me to take proactive measures if any issues arise.

