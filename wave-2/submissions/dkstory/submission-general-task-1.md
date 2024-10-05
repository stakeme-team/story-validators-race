# Story validator node install
spec 4 Core 8Gb Ram 200Gb SSD

1. รันอัพเดท ลงสิ่งจำเป็น
```
sudo apt update
sudo apt install curl git make jq build-essential gcc unzip wget lz4 aria2 -y
sudo apt update && sudo apt -y upgrade
```

2. ดึงไฟล์ node
```
wget https://story-geth-binaries.s3.us-west-1.amazonaws.com/geth-public/geth-linux-amd64-0.9.2-ea9f0d2.tar.gz
tar -xzvf geth-linux-amd64-0.9.2-ea9f0d2.tar.gz
[ ! -d "$HOME/go/bin" ] && mkdir -p $HOME/go/bin
if ! grep -q "$HOME/go/bin" $HOME/.bash_profile; then
  echo 'export PATH=$PATH:$HOME/go/bin' >> $HOME/.bash_profile
fi
sudo cp geth-linux-amd64-0.9.2-ea9f0d2/geth $HOME/go/bin/story-geth
wget https://story-geth-binaries.s3.us-west-1.amazonaws.com/story-public/story-linux-amd64-0.9.11-2a25df1.tar.gz
tar -xzvf story-linux-amd64-0.9.11-2a25df1.tar.gz
[ ! -d "$HOME/go/bin" ] && mkdir -p $HOME/go/bin
if ! grep -q "$HOME/go/bin" $HOME/.bash_profile; then
  echo 'export PATH=$PATH:$HOME/go/bin' >> $HOME/.bash_profile
fi
sudo cp story-linux-amd64-0.9.11-2a25df1/story $HOME/go/bin/story
```

3. รัน
```
source $HOME/.bash_profile
```

4. รัน เปลี่ยนชื่อ moniker เป็นชื่อ node อะไรก็ได้ของตัวเอง
```
story init --network iliad --moniker "MONIKER"
story init - network iliad
```

5. สร้าง service geth
```
sudo tee /etc/systemd/system/story-geth.service > /dev/null <<EOF
[Unit]
Description=Story Geth Client
After=network.target

[Service]
User=root
ExecStart=/root/go/bin/story-geth --iliad --syncmode full
Restart=on-failure
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF
```

6. สร้าง service story
```
sudo tee /etc/systemd/system/story.service > /dev/null <<EOF
[Unit]
Description=Story Consensus Client
After=network.target

[Service]
User=root
ExecStart=/root/go/bin/story run
Restart=on-failure
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF
```

7. รัน
```
sudo systemctl daemon-reload && \
sudo systemctl start story-geth && \
sudo systemctl enable story-geth
sudo systemctl daemon-reload && \
sudo systemctl start story && \
sudo systemctl enable story
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$(curl -sS https://story-testnet-rpc.polkachu.com/net_info | jq -r '.result.peers[] | "\(.node_info.id)@\(.remote_ip):\(.node_info.listen_addr)"' | awk -F ':' '{print $1":"$(NF)}' | paste -sd, -)\"/" $HOME/.story/story/config/config.toml
sudo systemctl restart story
sudo systemctl restart story-geth
```

8. เช็คสถานะ ทั้งสองอันต้องไม่ error
```
sudo journalctl -u story-geth -f -o cat
```
```
sudo journalctl -u story -f -o cat
```

9. เช็คสถานะ sync จนกว่า catching_up จะเป็น false ค่อยทำต่อ
```
curl localhost:26657/status | jq
```
เช็ค block เทียบกับ ล่าสุดที่ https://testnet.story.explorers.guru/
```
curl -s localhost:26657/status | jq .result.sync_info.latest_block_height
```

10. ดึง address กับ private key มาเก็บไว้
```
story validator export - export-evm-key
```
```
cat /root/.story/story/config/private_key.txt
```

11. ขอ faucet เข้าเป๋า (เอา pv key ไปใส่ MM ก่อนก็ได้) จาก https://docs.story.foundation/docs/faucet

12. Stake 5 $IP
```
validator create --stake 500000000000000000
```

13. เช็ค validator address
```
cd ~/.story/story/config
cat priv_validator_key.json | grep address
```

14. เอา val address ไปค้นบน https://testnet.story.explorers.guru/ เพื่อดูสถานะ node