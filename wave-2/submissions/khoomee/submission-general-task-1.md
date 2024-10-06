# ProjectStory
Hi am Khoonme Samee
(Update geth & Story Last version)
1 .Install Node using command  
bash <(curl -s https://raw.githubusercontent.com/KhoonmeeZa/ProjectStory/main/install_story.sh)

When running for a while, input the desired Node or Moniker name.
Wait until it's finished.

2 .Don't forget to create a validator and save it.
using command
story validator export --export-evm-key --evm-key-path .env
story validator export 

Transfer IP into EVM 2ip or more
and create validator  using command
story validator create --stake 1000000000000000000



3 .Install Snapshot using command
bash <(curl -s https://raw.githubusercontent.com/KhoonmeeZa/ProjectStory/main/install_Snapshot.sh)

Wait until it's finished. 
This may take several minutes or hours because the file is large, 90gb or more.

4 .Check our node status, it will show Block Left. Sync will be released in time for the latest block until Block Left 0 is considered successful.
Install Check our node status command
bash <(curl -s https://raw.githubusercontent.com/KhoonmeeZa/ProjectStory/main/sync_Status.sh)
