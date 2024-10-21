**Story Protocol Node Installation Guide & Validator creation** 

In this guide, we use 3 scripts. The 1st one is for installing and syncing the node. The 2nd one is for checking the sync status. The 3rd one is for creating a validator. I will provide detailed instructions for each script.

---------------------------------------------------------------------------------------------------------------------------------------------------------------
**1. Story Protocol Node Installation**

To get started, download the 1st script, give it the right permissions, and run it:
```
curl -O https://raw.githubusercontent.com/Vasya-kripto/story/refs/heads/main/story.sh && chmod +x story.sh && ./story.sh
```
**Full Installation Confirmation** 
  
You'll be asked:
```
Do you want to proceed with the full installation and launch of the Story Protocol node? (yes/no)
```
Type `yes` to start, or `no` if you're not ready yet.

**Firewall Configuration**   

Next, the script asks:
```
Do you want to install and configure a firewall to restrict ports? (yes/no)
```
Type `yes` if you want to configure the firewall, or `no` if you don’t need it.   

Then, if you choose to install the firewall, you’ll be asked for your SSH port:
```
Enter your SSH port (default is 22):
```
If you use a custom port for SSH, enter it. Otherwise, just press Enter to use port 22. 

After entering your SSH port, you will see the following prompt from UFW:
```
Command may disrupt existing ssh connections. Proceed with operation (y|n)?
```    
Type `y` to continue.   

**Node Moniker Setup**   

Choose a name for your validator & press `enter`
```
Please enter your node moniker:
```

**Cosmovisor Installation**

The script will ask if you want Cosmovisor for auto-upgrades:
```
Do you want to install Cosmovisor for automatic upgrades? (yes/no)
```
`yes` to set it up, `no` if you prefer to handle upgrades manually.

**Final Steps**   

Once everything is set up, the script will show:
```
The Story Protocol node installation is complete. Your node is now syncing.
```
Your node is now syncing and you’re all set.

---------------------------------------------------------------------------------------------------------------------------------------

**2. Node Sync Status Check**   

By downloading and running this script, you can check if your node is fully synchronized or not. When Remaining Blocks: 0, the node is fully synced and you can proceed to the next step of creating a validator.

Download and execute the script:   
```
curl -O https://raw.githubusercontent.com/Vasya-kripto/story/refs/heads/main/status.sh && chmod +x status.sh && ./status.sh
```

To run the script again later, simply use the command:
```
./status.sh
```

--------------------------------------------------------------------------------------------------------------------------------------------

**3. Validator Creation**  

Download & run the script:
```
curl -o validator.sh https://raw.githubusercontent.com/Vasya-kripto/story/refs/heads/main/validator.sh && chmod +x validator.sh && ./validator.sh
```   

After running the script, you will see your EVM public key and private key. Save the private key in a secure place. Then, obtain tokens to your public key using the faucet, enter `yes`, and the script will create the validator.

-----------------------------------------------------------------------------------------------------------------------------------------------   

All 3 scripts can be found here: `https://github.com/Vasya-kripto/story`
