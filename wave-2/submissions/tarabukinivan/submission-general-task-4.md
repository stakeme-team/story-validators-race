# [STORY TOOLS]

## All pages are responsive.

<details>
  <summary>1) Install node guide</summary>
  [Manual and Auto Installation](https://snapshots.tarabukin.work/installation.html)  <br>
  The page has copy buttons, automatic replacement of Story and Geth ports, automatic replacement of service names.   
  Fresh peers are loading

  ![install guide](https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/images/installstory.png)
  
</details>

<details>
  <summary>2) 🔗Snapshot and StateSync</summary>
[Snap and State](https://snapshots.tarabukin.work/)  
  
The snapshot is updated every 15 hours. <br>
It has a counter for the next update, the height of the snapshot and the time of the snapshot. The service has an automatic change of the service name

![Snap and State](https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/images/snapshot4.png)

</details>

<details>
  <summary>3) RPC Scaner,Live Peers and Autoupgrader</summary>
[RPC Scaner and Live Peers](https://snapshots.tarabukin.work/tools.html)  

RPC and peers are updated every 5 hours. <br>The script requires you to input the height and the update version. It creates an automatic update script to be executed once the specified height is reached.


  
![RPC Scaner](https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/images/rpcscaner.png)

</details>

<details>
  <summary>4) Grafana</summary>
Instructions for installing the Grafana monitoring and alerting system. Dashboard made specifically for Story. Compares block height with API block, Network information, Checks synchronization, jail, etc. Sends notification to Telegram 
  
[Grafana Instruction](https://github.com/tarabukinivan/story_files/blob/main/grafana_install_guide.md)   

[Demo:](https://grafana.tarabukin.work/)  
  
![grafana](https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/images/grafana4.png)

</details>

<details>
  <summary>5) Telegram bot </summary>
The bot monitors the operation of the RPC, the number of peers for Story and Geth.
It checks the Story API. If the API is operational, the command '/storyapiinfo' becomes available, which displays the network height, the total number of validators, the number of active validators, and some network parameters. It compares the node height with the API height. If the node height lags by 300 blocks, it sends a notification to the chat.<br>  
When the proposal comes out, I will add tracking of the proposal and voting from the bot.

Available commands:
 * /status - displays full information about the RPC.
 * /df - displays information about HDD.
 * /free - displays information about RAM.
 * /peers - information about Story and Geth peers.
 * /infoval - validator info
 * /nodeheight - the height of the node.
 * /storyapiinfo - network information from the Story API.
 * /last10blockinfo - information about signing the last 10 blocks.
 * /mute - temporarily disable monitoring, for example during an update or temporarily exit the active set
 * /unmute - enable monitoring
 * /logs - last 30 line log
 * /links - story links

[Install guide](https://github.com/tarabukinivan/storybot)

Video instruction https://youtu.be/dLL5FUvFi28

Demo: [@story_network_bot](https://t.me/story_network_bot)

![bot](https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/images/storybot.png)

![tg](https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/images/strorytg.png)

![tg3](https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/images/tg3.png)

</details>

[more](https://github.com/tarabukinivan/story_files/blob/main/validator_tools.md)

[DISCORD](https://discordapp.com/users/810477748614332437) \
[TELEGRAM](https://t.me/tarabukinivan)
