# Story (꧁IP꧂) All Links : [Here](https://linktr.ee/storyprotocol)

![image](https://github.com/user-attachments/assets/934b2643-976f-4b61-aef6-20f9a983c743)

## Story is the World’s IP Blockchain, onramping Programmable IP to power the next generation of AI, DeFi, and consumer applications.

![image](https://github.com/user-attachments/assets/ec373731-ad4d-41fc-95c6-7c6e4a147175)

## What you need to do for installation is to enter the code below and let the script guide you.
```console
source <(curl -s https://raw.githubusercontent.com/aksamlan/story/main/installstory.sh)
```
## For block control, you can enter the following code.
##### If you have changed the port, replace the ‘26’ number at the beginning with the port you are using and try. Port ‘26’ is the default port number.
```console
curl localhost:26657/status | jq
```
# We export the wallet you created and add the private key to the Matemask Wallet. Then we request Token via Faucet and apply the following codes to create Validator.

## [Faucet 1](https://faucet.story.foundation/) - [Faucet 2](https://thirdweb.com/story-iliad-testnet) - [Faucet 3](https://faucet.quicknode.com/story)

```console
# Wallet Export
story validator export --export-evm-key
```
```console
# Copy the Private key here
sudo nano ~/.story/story/config/private_key.txt
```
```console
# Create Validator
story validator create --stake 1000000000000000000 --private-key "your_private_key"
```
