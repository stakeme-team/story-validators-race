## validator-alertbot

### Github repository link: https://github.com/vitwit/validator-alertbot


Validator alertbot for cosmos ecosystem

 -   **Validator alert bot** is a custom alerting module has been developed to alert on key validator health events. The module uses data from influxdb and trigger alerts based on user-configured thresholds.
 It also provides telegram based commands to know information about your validator activity.

## Install Prerequisites
- **Go 13.x+**
- **InfluxDB 1.7+**
- **Docker 19+**

### Here we are provinding steps to install influxdb, we assume you already have go and docker installed.

#### Install InfluxDB 

```sh
 cd $HOME
wget -q https://repos.influxdata.com/influxdata-archive_compat.key
echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list
```

#### Start influxDB

```sh
 sudo apt-get update && sudo apt-get install influxdb
 sudo service influxdb start

The default port that runs the InfluxDB HTTP service is :8086
```

**Note :** If you want cusomize the configuration, edit `influxdb.conf` at `/etc/influxdb/influxdb.conf` and don't forget to restart the server after the changes. You can find a sample 'influxdb.conf' [file here](https://github.com/jheyman/influxdb/blob/master/influxdb.conf).

### Getting Started (Download and run the alert bot)

```bash
git clone https://github.com/vitwit/validator-alertbot.git
cd validator-alertbot
cp example.config.toml config.toml
```
### Configure the following variables in `config.toml`

- *tg_chat_id*

    - Telegram chat ID to receive Telegram alerts, required for Telegram alerting.
    
- *tg_bot_token*

    - Telegram bot token, required for Telegram alerting. The bot should be added to the chat and should have send message permission.

- *sendgrid_token*

    - If you want to get email notifications, then configure your sendgrid_token

- *email_address*

    - Configure your email address to which you wish to get the email notifications.

- *alert_time1* and *alert_time2*

    - These are for regular status updates. To receive validator status daily (twice), configure these parameters in the form of "02:25PM". The time here refers to UTC time.

- *val_operator_addr*

    - Operator address of your validator which will be used to get staking, delegation and distribution rewards.

- *validator_hex_addr*

    - Validator hex address useful to know about last proposed block, missed blocks and voting power.

- *lcd_endpoint*

    - Address of your lcd client (ex: http://localhost:1317).
    
    - If you want to start the rest server you can follow this (ex: gaiacli rest-server --laddr "http://localhost:1317" --chain-id testing) 

- *external_rpc*

    - External open RPC endpoint(secondary RPC other than your own validator). Useful to gather information like validator caught up, syncing and missed blocks etc.

- *validator_rpc_endpoint*

     - Validator rpc end point (RPC of your own validator) useful to gather information about network info, validator voting power etc.

- *balance_change_alert*

    - If you want to receive alerts when your account balance changes then configure **balance_change_alert** to "yes" otherwise "no".

- *block_diff_alert*

    - If you want to receive block difference alert configure this **enable_alert** to "yes" otherwise "no".

    - Configure **block_diff_threshold** An integer value to receive *Block difference alerts*, e.g. a value of 2 would alert you if your validator falls 2 or more blocks behind the chain's current block height.

- *voting_power_alert*

    - If you want to receive block difference alert configure this **enable_alert** to "yes" otherwise "no".

    - Configure **voting_power_threshold** to receive alert when the voting power reaches or drops below of the threshold given.

- *Peers_alert*

    - If you want to receive block difference alert configure this **enable_alert** to "yes" otherwise "no".

    -  Configure **num_peers_threshold** to get an alert if the no.of connected peers falls below the threshold.

- *influxdb*

    - Configure *port*, *username* and *database*. Make sure not to forget creating a database and configure it before you run the code.

After populating config.toml, check if you have connected to influxdb and created a database which you are going to use.

If your connection throws error "database not found", create a database

```bash
$   cd $HOME
$   influx
>   CREATE DATABASE db_name

ex: CREATE DATABASE akash_alertbot
```

Add a retention policy for the db
```bash
$ use db_name
$ CREATE RETENTION POLICY "seven_days_only" ON db_name DURATION 7d REPLICATION 1 DEFAULT;
$ show retention policies
```

Note : Before running the code make sure that you have configured all the required details otherwise the code may give fatal errors.

- Build and run the alerting bot using binary

```bash
$ go build -o validator-alert-bot && ./validator-alert-bot
```

- Run using docker

```bash
$ docker build -t alertbot .
$ docker run -d --name validator-alertbot alertbot
```

## Here is the list of available alerts and telegram commands

 - Alert about validator node sync status.
 - Alert when a validator miss a block
 - Alert when there is a change in account balance.
 - Alert when no.of peers count falls below of **num_peers_threshold** which is user configured in *config.toml*
- Alert when the block difference between network and validator reaches or exceeds the **block_diff_threshold** which is user configured in *config.toml*.
- Alert about validator health, i.e. whether it's voting or jailed. You can get alerts twice a day based on the time you have configured **alert_time1** and **alert_time2** in *config.toml*. This is a useful sanity check, to confirm the validator is voting (or alerting you if it's jailed).
- Alert when the voting power of your validator drops below **voting_power_threshold** which is user configured in *config.toml*

### List of avaliable telegram commands
 To get response from these commands you can just */command_name** from your autorized telegram account.
 You will be getting response to your telegram account based on the tg_bot_token you have configured in *config.toml*

 - /status : Gives validator's status,current block height, voting power and network current block height.
 - /node : Gives status of caught-up
 - /peers : Returns number of connected peers
 - /balance : Returns the current balance of your account
 - /list : List of available commands

