Install node Story 1 CLick 1 Command
# Story Installation Script

This script installs Story-Geth and Story on Ubuntu 22.04.

## How to use:

Run the following command to install Story directly:
copy past enter 

curl -s https://raw.githubusercontent.com/ErrorCODE555/Story_Wave2/main/install_story.sh | bash



##Wait for input node name MONIKER and ENTER  to finish 
read Log

log geth:
sudo journalctl -u story-geth -f -o cat

Log Story:
sudo journalctl -u story -f -o cat







