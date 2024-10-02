# Story validators race

## Task 4: Launching the Validator Node
In the last step, you have to prepare and launch the validator node. This will prove, your node is ready to perform the validation function and keep the network running.

### Assignment Criteria:
- Create a validator wallet, if not already created
- Provide the address of the wallet in EVM format
- Sign this wallet with the message “story-validators-race task4” and send the signature
- You must have a validator node running and synchronized with the blockchain


You can use the web3 (Python) library to sign the message:

```python
from web3 import Web3
from eth_account.messages import encode_defunct

w3 = Web3()

private_key = '0x..'  # private key wallet validator
message = 'story-validators-race task4'
message_encoded = encode_defunct(text=message)

signed_message = w3.eth.account.sign_message(message_encoded, private_key=private_key)
print(f'Signature: {signed_message.signature.hex()}')
```

Make sure the signature is correct and belongs to your wallet:
```python
wallet_address = '0x'  #EVM address (validator wallet)
original_message = 'story-validators-race task4'

signature = signed_message.signature.hex()
message_encoded = encode_defunct(text=original_message)

recovered_address = w3.eth.account.recover_message(message_encoded, signature=signature)

if recovered_address.lower() == wallet_address.lower():
    print("Success")
else:
    print("Failed")
```

### Submission
Continue working in your forked repository inside the submissions directory.
In folder named after your GitHub username.
Create a subfolder named task4 inside this folder.
Run the checker_task4.sh script and save the output into a data.json file.

Paste the following format into the data.json file:
```bash
{
  "moniker": "string",
  "signature": "string",
  "evm_wallet": "string",
  "timestamp": number
}
```

Your folder structure should look like this:
```bash
├── submissions
│   └── github_username
│       ├── task1
│       │   └── README.md
│       ├── task2
│       │   └── data.json
│       ├── task3
│       │   └── data.json
│       ├── task4
│       │   └── data.json
│       └── user.json
```

Create a Pull Request (PR) with your submission.

### Importnant
Tokens will be sent to your wallet to create a validator (if it is not created) after completing the 4th task.
To get additional test tokens from the faucet https://story.faucetme.pro before submitting PR log in to the server https://discord.gg/stakeme from the discord account you specified in the first task.
> Note: The discord role won't be given, If you're not on the discord server after merged PR.
