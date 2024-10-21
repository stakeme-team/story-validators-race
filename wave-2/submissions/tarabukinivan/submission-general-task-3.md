## Story Validator Grafana Dashboard

### Demo

https://grafana.tarabukin.work/


### Grafana Dashboard is a visualization and analytics tool used to monitor and analyze data from your hardware metrics and Validator health metrics. 




My dashboard showing:
```
Story Network Info
	- Network name
	- Active Validators
	- TotalValidators
	- Alias
	- Api Height
Story rpc node info
	- Sync status
	- Geth sync status
	- peers number
	- Geth peers number
	- rpc node height
Validator Info
	- Moniker
	- valoper
	- Bonded tokens
	- jailed
	- tombstaned
	- delegators
ServerInfo
	- Total CPU
	- Cpu used
	- Totel RAM
	- RAM Used
	- Uptime
	- Disk space used
	- Network traffic
	- Disk IOps
Alerts for
	- SERVER IS UNAVAILABLE FOR MORE THAN 1 MINUTE
	- DISK IS MORE THAN 85 PERCENT FULL
	- CPU USED AT OVER 85 PERCENT
	- RAM USAGE IS OVER 85 PERCENT
	- Geth Sync Info is not "false"
	- Story Sync Info is not "false"
	- Geth has no peer
	- Story has no peer
	- Node is Jailed
	- Node Tombstoned
	- Node height lags behind API
```
### Install Instruction

https://github.com/tarabukinivan/story_files/blob/main/grafana_install_guide.md

### Download Dashboard Template

https://raw.githubusercontent.com/tarabukinivan/story_files/refs/heads/main/story_dashboard.json



