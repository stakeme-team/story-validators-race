https://github.com/lesnikutsa/story/tree/main/webserver

# Launching your own webserver

## Installation Steps

1. Download **custom_http_server.py** and **config.ini** files to your server

2. Create a directory for future files or set SHARE_DIR for webserver in config file. Default is `$HOME/node-share`
```
mkdir -p $HOME/node-share
```

3. Go to webserver directory and run python
```
cd $HOME/webserver
python3 custom_http_server.py
```
4. Use following command to get your webserver address
```
echo -e "\033[0;31m http://$(wget -qO- eth0.me):8000 \033[0m"
```
