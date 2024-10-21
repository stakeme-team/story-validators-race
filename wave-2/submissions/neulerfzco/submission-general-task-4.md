Please check the below template repository for Story:  
[story-snapshot-provider](https://github.com/neulerfzco/story-snapshot-provider)  

(Below is a copy of the README from my story-snapshot-provider repository) 

# Cosmos/Geth Snapshot Service

A Go-based service for creating and managing blockchain snapshots from Geth (Ethereum) and Cosmos nodes. The service compresses and stores snapshots periodically and implements automatic retention to delete older snapshots.

## Features

- Automated Geth and Cosmos snapshot creation.
- Configurable retention policy to keep only the latest `n` snapshots.
- Organized storage in subdirectories (`geth/` and `cosmos/`).
- Service management: stop nodes, create snapshots, and restart nodes automatically.
- Simple integration with Nginx for HTTPS serving.

## Dependencies
[go](https://go.dev/dl/) - tested on go version go1.22

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/snapshot-service.git
   cd snapshot-service
   ```

2. **Build the project**:
```bash
go mod tidy
make snapshot-creator 
make file-server
```

3. **Create `config.yaml` **:
```bash
cat <<EOL > config.yaml
geth_rpc_url: "http://localhost:8545"
geth_client_name: "geth"
geth_service_name: "geth.service"
geth_data_dir: "$HOME/.story/geth/iliad/geth/chaindata"
cosmos_rpc_url: "http://localhost:26657/status"
cosmos_client_name: "story"
cosmos_service_name: "story.service"
cosmos_data_dir: "$HOME/.story/story/data"
geth_snapshot_type: "pruned"
cosmos_snapshot_type: "pruned"
snapshot_dir: "$PWD/public/snapshots"
snapshot_interval_hours: 4
log_file: "$PWD/public/snapshot_service.log"
server_port: 8080
EOL
```

## Usage 
```bash
#run it in background (locate it using ps aux | grep "snapshot_creator" and kill it)
./bin/snapshot_creator --config ./ &
#run it in background (locate it using ps aux | grep "file_server" and kill it)
./bin/file_server --config ./ & 
```



## Nginx integration 
the server is hosting the files on port 8080, so just create a nginx config with your domain and make it tsl/ssl 
```bash
server {
    listen 80;
    server_name yourdomain.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl;
    server_name yourdomain.com;
    ssl_certificate /path/to/fullchain.pem;
    ssl_certificate_key /path/to/privkey.pem;

    location / {
        proxy_pass http://localhost:8080;
    }

    location /snapshots/ {
        proxy_pass http://localhost:8080/snapshots/;
    }
}
```



