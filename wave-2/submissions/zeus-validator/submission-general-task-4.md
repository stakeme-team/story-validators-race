# Story Discord Faucet bot
We built a faucet bot, run in Discord with simplicity and ease.

![faucet bot](https://i.ibb.co/SvVydgC/giv.gif)

# Feature
The bot has many features:
- Check balance of an address
- request token for an address
- See story prefix addresses from pubkey

About faucet feature, each user can only request only 1 address once in every 12 hours, which can be also configured in toml. The faucet also has daily cap, so it won't quickly ran out from spam. Each successful tx will show the hash and user can easily check the hash on explorer.

# Install
First, you will need create a bot and add to your Discord server. The bot also requires send messages permissions so it can listen in channels and send message in the chat. You can follow this [site](https://discordpy.readthedocs.io/en/stable/discord.html) to create a bot and add to your server. After the step, you will have a secret token, which can be used in the code.

You also need an account with fund stored in geth node. Here are the steps to import an account:
```bash
geth --datadir $HOME/.story/geth/iliad account import /path/to/priv_key
geth --datadir $HOME/.story/geth/iliad account list
```
Geth also needs to have flags `--http --http.api personal,eth,web3 --rpc.enabledeprecatedpersonal` enabled so the faucet could work.

Bot repo: https://github.com/LianD-09/discord-faucet-bot

Then, in the bot repo, add configuration to `config.toml`:
```toml
[networks]
    [networks.iliad-0]
        binary          = "geth"
        prefix          = "0x"
        denomination    = "IP"
        data_dir        = "$HOME/.story/geth/iliad"
        chain_id        = "iliad-0"
        node_url        = "$HOME/.story/geth/iliad/geth.ipc"
        faucet_address  = "<your-address>"
        daily_cap       = "1000" # max amount send in a day
        amount_to_send  = "100" # each send

[discord]
    bot_token = "bot.token"
    channels_to_listen = "channel1,channel2"
    request_timeout    = "43200" # block time during requests
```
Install required libs:
```bash
pip install -r requirements.txt
```
After everything is on set, you can run `python3 faucet.py`. The bot will start and listen to new messages in configured channels. Here are the commands you can ask the bot:
- `$help`: This command will show the full help message about the available commands as well as their function
- `$faucet_address`: This command will show the address of faucet
- `$balance <0xaddress>`: This command will show the balance of provided address
- `$request <0xaddress>`: This command will check if the user and address are eligible for receiving token or not, and send the token to the address. It will show the tx hash so the user can check the transaction details. Every address and user can only request once during `request_timeout` window.
- `$convert <base64-pubkey>`: This command will convert and show the address in both `story` and `0x` syntax. The user needs to provide compressed pubkey in base64 format, which can be obtained from this command:
```bash
story validator export --keyfile $HOME/.story/story/config/priv_validator_key.json
```
