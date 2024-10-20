## Story rpc and peer finder

https://github.com/silentnoname/cosmos-node-finder

### Use:

```
git clone https://github.com/silentnoname/cosmos-node-finder
cd cosmos-node-finder 
make install
```
### Find public rpcs by one rpc
`cosmos-node-finder rpcfinder <one public rpc> <chain-id>`

for example

`cosmos-node-finder rpcfinder https://story-testnet-rpc.synergynodes.com:443 iliad-0`
### 
Find live peers by one rpc
`cosmos-node-finder peerfinder <one public rpc> <chain-id>`

for example
`cosmos-node-finder peerfinder https://story-testnet-rpc.synergynodes.com:443 iliad-0`


## Story node ansible
Deploy story node using ansible

https://github.com/silentnoname/story-ansible