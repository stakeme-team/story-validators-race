****Story Protocol Snapshot Downloader Guide****

  
**Snapshot Links**:

Pruned Snapshots: https://snapshots.story.stakin-nodes.com/


To download, execute the following command:

```
cd $HOME
#Story snapshot
aria2c  -x  16  -s  16  -k  1M https://snapshots.story.stakin-nodes.com/story_1501156.tar.lz4

#Geth snapshot
aria2c  -x  16  -s  16  -k https://snapshots.story.stakin-nodes.com/story_geth_1501156.tar.lz4

```

**Stop Services:**

```
sudo systemctl stop story
sudo systemctl stop storygeth 
``` 

**Backup  `priv_validator_state.json`**

  ```
  cp ~/.story/story/data/priv_validator_state.json ~/.story/priv_validator_state.json.backup
  ```

**Remove old data**

```
rm -rf ~/.story/story/data
rm -rf ~/.story/geth/iliad/geth/chaindata
```
Default: If the services are named `story` and `geth`, press Enter 2 time, to use the default names.

Custom Names: If you use different service names, you can input the correct names. Examples: storyprotocol or storyprotocol.service.

 

**Decompress snapshot**

```
#Story
sudo  mkdir  -p  /root/.story/story/data
lz4  -d  -c story_1501156.tar.lz4 > /dev/null

#Geth
sudo  mkdir  -p  /root/.story/geth/iliad/geth/chaindata
lz4  -d  -c story_geth_1501156.tar.lz4 > /dev/null
```
  
**Move  `priv_validator_state.json`  back**
```
cp ~/.story/priv_validator_state.json.backup ~/.story/story/data/priv_validator_state.json
```
  
**Restarting Services**

```
sudo systemctl start story
sudo systemctl start storygeth
```

