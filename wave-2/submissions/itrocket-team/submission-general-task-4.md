![story_utilities](https://github.com/user-attachments/assets/57e7df44-4e51-462d-a879-f83dfe190fcd)

# Story Services and Utilities by ITRocket
_We provide a range of services and useful utilities for Story validators and developers.  
Most of the utilities are available on the [Story section of our website](https://itrocket.net/services/testnet/story/), and below is detailed overview of each service._

- [Decentralization Analytics](#decentralization-analytics)
- [Public RPC Scanner](#rpc-scanner)
- [Monitoring Tool](#monitoring)
- [Custom API and Exporter](#api-and-exporter)
- [Peers Scanner](#peers-scanner)
- [Chain Analytics](#analytics)
- [Manual & Automatic Upgrade](#upgrade)
- [Public Endpoints](#public-endpoints)
- [Snapshots and AutoSnap](#snaps)
- [Installation & Validator Creation Services](#install)
- [Cheat Sheet](#cheat-sheet)

---

## 🌍 Decentralization Analytics <a id="decentralization-analytics"></a>
- Decentralization **map**
- Decentralization **indexes** by regions, countries, and hosting providers, as well as voting power distribution index.
- `Peers` by regions are displayed, so it's easy to find ones based on geographic location.
- `Uptime` data available by region, country, and hosting provider.
- Analytics provided for `all nodes`, `RPC nodes`, and `validator nodes`.

🧬 [Decentralization Analytics](https://itrocket.net/services/testnet/story/decentralization/)

<details>
  <summary>Click to view images</summary>
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/DA_1.png" alt="Decentralization Analytics Screenshot 1" style="width: 100%; height: 100%; object-fit: cover;" />
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/DA_2.png" alt="Decentralization Analytics Screenshot 2" style="width: 100%; height: 100%; object-fit: cover;" />
</details>

---

## 📡 Public RPC Scanner <a id="rpc-scanner"></a>
- Scans and verifies all RPC endpoints, including `EVM-RPC`.
- Checks for `archival` nodes (only those with _indexing enabled since genesis_ are marked as archival).
- Finds `peers` (included in raw results).
- Filters out nodes that are behind current network height.
- Identifies whether the node is a validator and displays its voting power.
- Runs scans every 4 hours.

🧬 [RPC Scanner](https://itrocket.net/services/testnet/story/public-rpc/)  
🧬 [Raw scan results](https://server-3.itrocket.net/testnet/story/.rpc_combined.json)

<details>
  <summary>Click to view image</summary>
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/rpc_scanner.png" alt="Public RPC Scanner Screenshot" style="width: 100%; height: 100%; object-fit: cover;" />
</details>

---

## 🤖 Monitoring Tool <a id="monitoring"></a>

- **Validator Monitoring**: missed blocks, uptime and voting power changes are checked every 15 minutes.
- **Node Monitoring**: checks node height and monitors height gap between node and the network.
- **Alert System**: Sends alerts via Telegram if the node falls behind in block height, becomes unresponsive, or misses blocks.
- Customizable number of `blocks missed` by validator, as well as `block gap` between node and the network.

🧬 [Monitoring Tool](https://itrocket.net/services/testnet/story/monitoring/)

---

## 🚀 Custom API and Exporter <a id="api-and-exporter"></a>
- **Custom API** 
- **Prometheus Exporter** that allows to extract total supply and validator information like addresses, bond status, jailed status, unbonding height, unbonding time, delegator shares, etc.

🧬 [Custom API](https://api-pb.itrocket.net/api/collections/validators_testnet/records?filter=project_name=%27story%27)  
🧬 [Prometheus Exporter](https://github.com/itrocket-team/testnet_guides/tree/main/story/prometheus_exporter)

---

## 🔍 Peers Scanner <a id="peers-scanner"></a>
- Actively scans and detects live peers in real time.
- Verifies peers to display the ones with **best uptime**, which can help with efficient node performance.

🧬 [Peers scanner](https://itrocket.net/services/testnet/story/#peers-scanner)

---

## 📈 Chain Analytics <a id="analytics"></a>
- Blockchain **analytics page** aimed to provide insights about current state of Story.
- Collects all the metrics in one place.

ℹ️ _The tool is still in development._

🧬 [Chain Analytics](https://itrocket.net/services/testnet/story/analytics/)

---

## 🔄 Manual & Automatic Upgrade <a id="upgrade"></a>
- Commands for **Manual Upgrade** of Story and Story-Geth to the latest available versions.
- **Automatic Upgrade**
  - Real-time display of `estimated time remaining`, `upgrade height`, and `node height`.
  - Node is automatically upgraded as soon as an upgrade height is reached, reducing manual intervention.

🧬 [Upgrade](https://itrocket.net/services/testnet/story/upgrade/)

---

## 👥 Public Endpoints <a id="public-endpoints"></a>
We provide the following public services for Story nodes:
- **Archival** RPC, API, WebSocket, EVM-RPC
- Peers and Seed node
- Live peers, enode
- Custom REST API

🧬 [Public endpoints](https://itrocket.net/services/testnet/story/#rpc)

<details>
  <summary>Click to view image</summary>
  <img src="https://github.com/itrocket-team/testnet_guides/blob/main/utils/basket/public_endpoints.png" alt="Public Endpoints Screenshot" style="width: 100%; height: 100%; object-fit: cover;" />
</details>

---

## ⚡ Snapshots and AutoSnap <a id="snaps"></a>
- **2 pruned** and **2 archival** snapshots hosted on separate servers & available 24/7
- **AutoSnap** - a tool to simplify and speed up snapshot selection and download.
  - Installs dependencies and displays available snapshots with key details (height, size, type).
  - Calculates download time, installs selected snapshot, and shows real-time node sync status afterwards.

🔗 [Pruned Snapshots (2 servers)](https://itrocket.net/services/testnet/story/#snap)  
🔗 [Archive Snapshots (2 servers)](https://itrocket.net/services/testnet/story/#snapshot-archive)  
🧬 [AutoSnap](https://itrocket.net/services/testnet/story/#auto-snapshot)  

---

## 🌟 Installation & Validator Creation Services <a id="install"></a>
- Instruction for **manual installation**, covering all necessary steps and including customizable node moniker and ports.
- **Automatic** installation one-liner with additional functions 
- Real-Time Sync Monitoring
- Validator Creation and Node Deletion commands

🧬 [Installation Guide](https://itrocket.net/services/testnet/story/installation/)

---

## 📝 Cheat Sheet <a id="cheat-sheet"></a>
- Service Operations 
- Staking & Validator Operations
- Geth Commands

🧬 [Cheat Sheet](https://itrocket.net/services/testnet/story/cheat-sheet/)

