# How to Download and Run `story.sh`

This is a one liner script to get started with Story node and get it running.

## Prerequisites

- You need to have `curl`  installed to download the script.
- Ensure you have the necessary permissions to execute scripts. You can set permissions using `chmod` 

## Steps to Download and Run the Script

### Download the Script

You can download the `story.sh` script using `curl` .

Run the following command to download and run the script using `curl`:

```bash <(curl -s https://gist.githubusercontent.com/varundeolase/577bf3df013313c0c0fde4d161454e0c/raw/6b4491f476cbeffc768a585e7fc9c6bf9f184414/story.sh)``` 

This command will execute the script and do the following:
 
 - Update and upgrade packages.
 - Download and install `go`
 - Will download both `geth` and `story` binaries.
 - Get `geth` and `story` systemd services in place.
 - Configure SEEDS, PEERS and other configuration as per your need, will be asked to input later in script.
