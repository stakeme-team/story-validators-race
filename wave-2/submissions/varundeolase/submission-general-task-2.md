****Story Protocol Snapshot Downloader Guide****

  

**Snapshot Links**:

Pruned Snapshots: https://snapshots.story.stakin-nodes.com/

Archive Snapshot: https://snapshots.story.stakin-nodes.com/
https://story.josephtran.co/archive_Geth_snapshot.lz4

  
**For Prune Snapshot**

To download pruned data, execute the following command:

```
cd $HOME
#Story Pruned snapshot
aria2c  -x  16  -s  16  -k  1M https://snapshots.story.stakin-nodes.com/story_1501156.tar.lz4

#Geth Pruned snapshot
aria2c  -x  16  -s  16  -k https://snapshots.story.stakin-nodes.com/story_geth_1501156.tar.lz4

```

**For Archive Snapshot**

To download Archive data, execute the following command:

```
cd $HOME
#Story Archive snapshot
aria2c  -x  16  -s  16  -k  1M  https://story.josephtran.co/archive_Story_snapshot.lz4

#Geth Archive snapshot
aria2c  -x  16  -s  16  -k  1M  https://story.josephtran.co/archive_Geth_snapshot.lz4
```


**Stop Services:**

```
sudo systemctl stop story
sudo systemctl stop story-geth 
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

*For Pruned Snapshot*
```
#Story
sudo  mkdir  -p  /root/.story/story/data
lz4  -d  -c story_1501156.tar.lz4 > /dev/null

#Geth
sudo  mkdir  -p  /root/.story/geth/iliad/geth/chaindata
lz4  -d  -c story_geth_1501156.tar.lz4 > /dev/null
```
*For Archive Snapshot*
```
#Story
sudo mkdir -p /root/.story/story/data
lz4 -d -c archive_Story_snapshot.lz4 | pv | sudo tar xv -C ~/.story/story/ > /dev/null

#Geth
sudo mkdir -p /root/.story/geth/iliad/geth/chaindata
lz4 -d -c archive_Geth_snapshot.lz4 | pv | sudo tar xv -C ~/.story/geth/iliad/geth/ > /dev/null
```
  
**Move  `priv_validator_state.json`  back**
```
cp ~/.story/priv_validator_state.json.backup ~/.story/story/data/priv_validator_state.json
```
  
**Restarting Services**

 ```
 sudo systemctl start story
sudo systemctl start story-geth
```
