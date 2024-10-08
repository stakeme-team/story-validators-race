# Synergy Nodes
<img src="https://raw.githubusercontent.com/SynergyNodes/SynergyNodes_Logo/main/Synergy_Nodes.png" style="width: 50%; fill: white" />

Synergy Nodes was established in 2019 and brings five years of experience in validating various blockchain projects. Our team is comprised of four members: Aries (Founder and Technical Lead), Capri (Technical Support), Scrop (Technical Support), and Callisto (Business Development Manager).

Our inaugural validator node, Terra Classic—formerly known as Terra, was launched in May 2019. Over the subsequent years, we have gained substantial technical knowledge in securely validating blockchains and providing core infrastructure support for blockchain projects, details of which are listed below. We have expanded our operations and services for 26 mainnets and various testnets.

We have earned recognition from multiple projects, notably Terra, where we are a leading validator managing IBC transfers between Terra and other Cosmos chains.

Synergy Nodes is operating validator nodes for 26 Mainnets and provide various core-infra support for Blockchain projects such as, daily automated snapshots, public endpoints, state-sync, IBC relayers, access to peers, addrbook, genessis files, node installation guide, seed-node services, auto compounding, explorer based on ping.pub and more.

## Networks currenty supported

### We operate Validator nodes for the following Mainnets:

> Sui, Axelar, Terra, Zetachain, Andromeda, Nibiru, Persistence, Stride, Penumbra, Oraichain, Kujira, Mars Protocol, Whitewhale, Seda, Canto, Cheqd, Pryzm, Provenance, Router, Haqq, Source, Meme Network, BlockX, Tenet, Neutaro, Pylons

### We also operate Validator nodes for the following Testnets:

> Berachain, Elys Network, Union, Side Protocol, Airchains, Soarchain

All information available on our website - https://synergynodes.com

### Blockchain Explorer 

We are operating a Cosmos blockchains explorer at CosmosRun.info for both mainnets and testnets. This is forked from ping.pub

URL: https://cosmosrun.info

### Youtube Channel

Our Youtube channel is focused on providing technical tutorials on installing and operate validator nodes for Cosmos based blockchains. Along with this, we also create many other blockchain based tutorials which are useful for users.

URL: https://www.youtube.com/channel/UCFOFPbgP0wLTQ007NtNl_oQ

### Our X (Twitter) Account:
https://x.com/SynergyNodes

### Our Zetachain Cross chain bridge:
https://zetabridge.synergynodes.com/

## Our Core-Infra Services

We actively engage with team members, other Validators and also with the community. We provide the following Core-Infra support and services for all the blockchains where we validate:
- Daily Automated snaphsots
- Public Endpoints: RPC, API, JSON RPC, gRPC
- State-sync
- Node Installation Guide
- Peers, Seed, access to Addrbook, Genesis files
- IBC Relayers
- Auto Compounding
- Explorer based on Ping.pub
- and more...

### Infrastructure for our Validator Nodes

For mainnets, we operate high end dedicated servers:

```
AMD Ryzen Threadripper 3970X 32-Core Processor (or)
AMD Ryzen 9 7950X3D 16-Core Processor 
128 GB DDR4 RAM
2x 2 TB NVMe SSDs
1 Gbits/S
```

### Provider:
``LeaseWeb, OVH``

For each chain where we operate Validator nodes, we run 3 servers.

```
1st for Main Validator Node
2nd as Backup Validator Node
3rd for IBC relayers, API, RPC endpoints
```

### Security for our Nodes:

For all the servers we implement the following security measures:
1. Deny all incoming traffic except for few important ports, such as 26656.
2. Hardware tied SSH Key Authentication to login to server. Without these keys, no one can login.
3. Removed SSH login using root password.
4. Remove default SSH port 22 and we are using custom port for SSH.
5. SSH login only allowed from 1 main IP, and allow temporary access to an other IP during travel.
6. Fully synced Backup server and we can switch to backup server within 5 mins if main sever is down.
7. PagerDuty alerts using Tenderduty with phone calls and email alerts which we have setup in an other independent server. This will notify us through phone call and email anytime if we miss 3 pre-commits.
