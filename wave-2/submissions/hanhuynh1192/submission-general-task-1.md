This script is used to install and manage components of Story and Geth on your system.

Use the following command in your terminal:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/hanhuynh1192/story-tasks/main/task1.sh)
```

To check logs of Story:
```bash
sudo journalctl -u story -f -o cat
```

To check logs of Geth:
```bash
sudo journalctl -u story-geth -f -o cat
```

Synchronization Check
```bash
curl localhost:26657/status | jq
```

Repository here:
https://github.com/hanhuynh1192/story-tasks
