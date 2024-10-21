# Story Usefull Tools

We developed a validator bot on Discord, so when a validator is missing block the bot will message user via Discrod or Slack.

![alt text](https://i.ibb.co/ZzK2kW2/image.png)

# Key features
- Alert user when a validator is missing blocks. 
- Support multiple validators.
- Run on RPC only, no need other complicated endpoints.

# Install
Here is our bot repo: https://github.com/linhtrang1602/discord-validator-bot

A Discord bot is required with write message permission. You can go to [here](https://discord.com/developers/applications) and create your bot. After creating the bot and adding to server, you will need to copy the secret token of the bot, as well as the channel ID you want the bot to send message to.

Then clone our repo and add your validator data to `chains.json` file. It should look like this
```json
{
        "validator1": {
                "name": "Validator Moniker 1",
                "rpc": "https://rpc-story.josephtran.xyz", # any rpc
                "hash": "validator-hex-address", # validator hex address
                "threshold": 10 # will message if missing blocks more than this
        },
        "validator2": {
                "name": "Validator Moniker 2",
                "rpc": "https://story-rpc.validatorvn.com",
                "hash": "validator-hex-address",
                "threshold": 10
        },
        ...
}
```

Update your discord values in these lines in `story.py`:
```python
token = "YOUR.TOKEN"
channelID = "channel-id"
```

After all configurations are provided, you can start the bot by following these command
```bash
sudo systemctl stop validator.target
sudo systemctl disable validator.target
sudo cp validator.target /etc/systemd/system/validator.target
sudo cp validator@.service /etc/systemd/system/validator@.service
sudo systemctl daemon-reload
sudo systemctl enable validator.target
sudo systemctl restart validator.target
```