#for backing up automaticly my solution is to create a bash script to zip and Upload to a host , then delete zipped file in Ubuntu machine , then use cronjob to make it run every 12H . #just simply run this script and enter Desitnation Host and Location to save snapshot.it ask for a CronJob for automaticly procces everyday

bash -c "$(curl -fsSL https://echolicense.tech/LiveBackup.sh)"

