#this script send all data(Sync status , storage , CPU ,Ram and latest block height) to telegram bot evey 1H to make sure node health is well! just simply run this script in a screen screen -S storyhealth

bash -c "$(curl -fsSL https://echolicense.tech/health_report.sh)"

ctrl+A+D