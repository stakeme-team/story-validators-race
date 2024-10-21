# Installation

#### System Requirements



| Hardware | Minimum Requirement |
| -------- | ------------------- |
| CPU      | 4 Cores             |
| RAM      |  8 GB               |
| DISK     | 200 SSD             |

#### Auto Install

While setting up Story Protocol, you will be asked for your **Moniker** name and the **port number** you want to use. After entering this information, you can successfully set up the Story Protocol Iliad testnet network.

```bash
bash <(wget -qO- https://raw.githubusercontent.com/CoinHuntersTR/props/refs/heads/main/AutoInstall/story.sh)
```



#### Check Logs for story-geth and story

```
sudo journalctl -u story-geth -f -o cat
sudo journalctl -u story -f -o cat
```

#### Synchronization Check

To check if your synchronization is complete, you can enter the following command. When entering the command, don't forget to replace '\<portnumber>' with the port number you provided during setup. If you receive a 'False' output, you can proceed with the next steps.

```
curl localhost:<portnumber>657/status | jq
```

#### Export Wallet

```
story validator export --export-evm-key
```

#### Get wallet key and import to Metamask wallet&#x20;

```
sudo nano ~/.story/story/config/private_key.txt
```

Import the private key of your validator wallet into your MetaMask wallet. Then, use the faucet to request IP test tokens.

Faucet : [ https://faucet.story.foundation/](https://faucet.story.foundation/)

#### Register validator

```
story validator create --stake 1000000000000000000 --private-key $(cat $HOME/.story/story/config/private_key.txt | grep "PRIVATE_KEY" | awk -F'=' '{print $2}')
```
