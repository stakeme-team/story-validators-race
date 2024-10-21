**Story Protocol Snapshot Downloader Guide**

**Snapshot Links**:   
Pruned Snapshot: http://46.4.114.99/   
Archive Snapshot: http://46.4.114.99/archive_snapshots/   

To download and run the snapshot downloader script, execute the following command:  
```
curl -O https://raw.githubusercontent.com/Vasya-kripto/story/refs/heads/main/snapshot.sh && chmod +x snapshot.sh && ./snapshot.sh
```   

**Script Guide:** 

**1. Stop Services:**   

First, the script asks whether you need to stop the Story and Geth services before downloading the snapshot.
Answer `yes` if you want the script to automatically stop these services. You’ll be prompted to provide their names (see next step).
Answer `no` if you want to skip this and download the snapshot without stopping the services (if they are already stopped).

**2. Service Names (if you chose yes in the previous step):**   

You’ll be asked to provide the service names for Story Protocol and Geth.   
Default: If the services are named `story` and `geth`, press Enter 2 time, to use the default names.      
Custom Names: If you use different service names, you can input the correct names. Examples: storyprotocol or storyprotocol.service.  

**3. Choosing Snapshot Type:**   

You’ll be asked to choose between two types of snapshots: Pruned or Archive.   
1 = Pruned snapshot   
2 = Archive snapshot   

**4. Restarting Services**

If you selected yes in step 1, the services will automatically restart after the snapshot download is completed. However, if you selected no, the services will not be restarted, and you’ll need to manually start them yourself after the download is finished.

