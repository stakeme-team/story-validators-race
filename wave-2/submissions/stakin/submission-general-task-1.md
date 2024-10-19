# How to Download and Run `story.sh`

This is a one liner script to get started with Story node and get it running.

## Prerequisites

- You need to have `curl`  installed to download the script.
- Ensure you have the necessary permissions to execute scripts.

## Steps to Download and Run the Script

### Download the Script

You can download the `story.sh` script using `curl` .

Run the following command to download and run the script using `curl`:

```bash <(curl -s https://gist.githubusercontent.com/tiagocmachado/9edfa29080d9bbd029683f8d66b6006c/raw/a3cbe5403100831aa92e006b5b8b848ff90ef70b/story.sh)``` 

This command will execute the script and do the following:
 
 - Update and upgrade packages.
 - Download and install `go`
 - Will download both `geth` and `story` binaries.
 - Place `geth` and `story` systemd services in place and start the services
