#!/bin/sh

location="$(pwd)"
unameSystem="$(uname -s)"
unameArchitecture="$(uname -m)"

unsupportedSystem() {
  echo "Unsupported system"
  exit 1
}

unsupportedArchitecture() {
  echo "Unsupported architecture"
  exit 1
}

usage() {
  echo "Usage: $0 <command>"
  echo "  Available commands:"
  echo "  install - Installing new instance and starting it"
  echo "  update - Update existing instance"
  echo "  address - Print public keys - Addresses"
  echo "  start - Starting validator"
  echo "  stop - Stoping validator"
  echo "  logStory - Showing story service logs"
  echo "  logGeth - Showing geth service logs"
  echo "  faucet - Print faucets"
  echo "  stake - Stake 1024 IP"

}
prepare_tools_linux() {
  echo "Linux tools preparation...."
  echo "It require sudo privileges"
  sudo apt update && sudo apt-get update
  sudo apt install -y curl wget
}

prepare_tools_maxOs() {
  echo "MacOs tools preparation...."
  brew update
  brew upgrade
  brew install curl wget
}

create_service_linux() {
  service_name=$1
  command=$2

  sudo tee "/etc/systemd/system/${service_name}.service" >/dev/null <<EOF
    [Unit]
    Description=${service_name} Service
    After=network.target

    [Service]
    User=root
    ExecStart=$command
    Restart=on-failure
    RestartSec=5
    LimitNOFILE=4096

    [Install]
    WantedBy=multi-user.target
EOF
  sudo systemctl daemon-reload
  sudo systemctl enable "$service_name"
  sudo systemctl start "$service_name"
}

load_service_macOs() {
  service_name=$1
  sudo launchctl load -w "/Library/LaunchDaemons/local.${service_name}.plist"
}

unload_service_macOs() {
  service_name=$1
  sudo launchctl unload -w "/Library/LaunchDaemons/local.${service_name}.plist"
}

create_service_macOs() {
  service_name=$1
  command=$2
  list=""

  for i in $command
  do
    list="$list<string>$i</string>"
  done

  unload_service_macOs "$service_name"

  sudo tee "/Library/LaunchDaemons/local.${service_name}.plist" >/dev/null <<EOF
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>Label</key>
            <string>local.${service_name}</string>
            <key>ProgramArguments</key>
            <array>
                ${list}
            </array>
            <key>RunAtLoad</key>
            <true/>
             <key>KeepAlive</key>
            <true/>
            <key>StandardOutPath</key>
            <string>/var/log/${service_name}-service.log</string>
            <key>StandardErrorPath</key>
            <string>/var/log/${service_name}-service-error.log</string>
        </dict>
    </plist>
EOF

#  load_service_macOs "$service_name"
#  sudo launchctl unload -w "/Library/LaunchDaemons/local.${service_name}.plist"
#  sudo launchctl load -w "/Library/LaunchDaemons/local.${service_name}.plist"
  #  sudo launchctl bootstrap "/Library/LaunchDaemons/local.${service_name}.plist"
}

create_service() {
  case "$unameSystem" in
  "Linux"*)
    create_service_linux "$1" "$2"
    ;;
  "Darwin"*)
    create_service_macOs "$1" "$2"
    ;;
  *) unsupportedSystem ;;
  esac
}

download_clients() {
  mkdir storyProtocol 2>>/dev/null
  cd storyProtocol

  mkdir story 2>>/dev/null
  mkdir geth 2>>/dev/null

  storyUrl="Error"
  gethUrl="Error"

  # Here we should improve support for other systems and architectures

  case "$unameSystem" in
  "Linux"*)
    case "$unameArchitecture" in
    "arm64"*)
      storyUrl="$(curl -s https://api.github.com/repos/piplabs/story/releases/latest | grep 'body' | grep -Eo 'https?://[^ ]+story-linux-amd64[^ ]+.gz')"
      gethUrl="$(curl -s https://api.github.com/repos/piplabs/story-geth/releases/latest | grep 'body' | grep -Eo 'https?://[^ ]+geth-linux-amd64[^ ]+.gz')"
      ;;
    *) unameArchitecture ;;
    esac
    ;;
  "Darwin"*)
    case "$unameArchitecture" in
    "arm64"*)
      storyUrl="$(curl -s https://api.github.com/repos/piplabs/story/releases/latest | grep 'body' | grep -Eo 'https?://[^ ]+story-darwin-arm64[^ ]+.gz')"
      gethUrl="$(curl -s https://api.github.com/repos/piplabs/story-geth/releases/latest | grep 'body' | grep -Eo 'https?://[^ ]+geth-darwin-arm64[^ ]+.gz')"
      ;;
    *) unameArchitecture ;;
    esac
    ;;
  *) unsupportedSystem ;;
  esac

  echo "Latest client versions:"
  echo "story = $storyUrl"
  echo "geth = $gethUrl"

  echo "Downloading story client..."
  rm story.tar.gz 2>>/dev/null
  wget -q "$storyUrl" -O story.tar.gz

  echo "Unziping story client..."
  rm ./story/story 2>>/dev/null
  tar zxf story.tar.gz --strip-components=1 -C story
  echo "Cleaning story archive..."
  rm story.tar.gz 2>>/dev/null

  echo "Downloading geth client..."
  rm geth.tar.gz 2>>/dev/null
  wget -q "$gethUrl" -O geth.tar.gz

  echo "Unziping geth client..."
  rm ./geth/geth 2>>/dev/null
  tar zxf geth.tar.gz --strip-components=1 -C geth
  echo "Cleaning geth archive..."
  rm geth.tar.gz 2>>/dev/null

  cd ..
}

initial_configuration() {
  cd storyProtocol/story
  echo "Enter moniker of your validation node:"
  read moniker

  echo "initializing consensus with $moniker"
  ./story init --network iliad --moniker "$moniker"

  echo "Private key was stored to .env file"
  ./story validator export --export-evm-key --evm-key-path .env
  cd ../..
}

create_validator() {
  cd storyProtocol/story
  ./story validator create --stake 1000000000000000000
  cd ../..
}

install_new_instance() {
  echo "Installing new instance in $location"

  case "$unameSystem" in
  "Linux"*) prepare_tools_linux ;;
  "Darwin"*) prepare_tools_maxOs ;;
  *) unsupportedSystem ;;
  esac

  download_clients

  initial_configuration

  echo "Creating story service"
  create_service story "$location/storyProtocol/story/story run"

  echo "Creating geth service"
  create_service geth "$location/storyProtocol/geth/geth --iliad --syncmode full"

  echo "First time synchronization can take few hours"
  start_service

  echo "Instalation completed"
}

update_instance() {
  stop_instance
  download_clients
  start_instance
}

stop_service_linux() {
  sudo systemctl stop story geth
}

stop_service_macOs() {
  unload_service_macOs story
  unload_service_macOs geth
#  sudo launchctl stop local.story
#  sudo launchctl stop local.geth
}

stop_service() {
  case "$unameSystem" in
  "Linux"*)
    stop_service_linux
    ;;
  "Darwin"*)
    stop_service_macOs
    ;;
  *) unsupportedSystem ;;
  esac
}

start_service_linux() {
  sudo systemctl restart story geth
}

start_service_macOs() {
#  sudo launchctl start local.story
#  sudo launchctl start local.geth
  load_service_macOs story
  load_service_macOs geth
}

start_service() {
  case "$unameSystem" in
  "Linux"*)
    start_service_linux
    ;;
  "Darwin"*)
    start_service_macOs
    ;;
  *) unsupportedSystem ;;
  esac
}

print_addresses() {
  ./storyProtocol/story/story validator export

  validatorAddress="error"
  case "$unameSystem" in
  "Linux"*)
    validatorAddress="$(cat ~/.story/story/config/priv_validator_key.json | grep address | cut -d\" -f4)"
    ;;
  "Darwin"*)
    validatorAddress="$(cat ~/Library/Story/story/config/priv_validator_key.json | grep address | cut -d\" -f4)"
    ;;
  *) unsupportedSystem ;;
  esac

  echo "Validator Page: https://testnet.story.explorers.guru/validator/$validatorAddress"
}

log_story() {
  echo "story logs:"
  case "$unameSystem" in
  "Linux"*)
    sudo journalctl -u story -f -o cat
    ;;
  "Darwin"*)
    cat /var/log/story-service.log
    cat /var/log/story-service-error.log
    ;;
  *) unsupportedSystem ;;
  esac

}

log_geth() {
  echo "geth logs:"
  case "$unameSystem" in
  "Linux"*)
    sudo journalctl -u geth -f -o cat
    ;;
  "Darwin"*)
    cat /var/log/geth-service.log
    cat /var/log/geth-service-error.log
    ;;
  *) unsupportedSystem ;;
  esac
}

print_faucet() {
  echo "2 IP/day - FaucetMe: https://story.faucetme.pro/"
  echo "2 IP/day - OKX Wallet: https://www.okx.com/web3/faucet"
  echo "1 IP/day - Story Faucet: https://faucet.story.foundation/"
  echo "0.01 IP/day - ThirdWeb: https://thirdweb.com/story-iliad-testnet"
  echo "0.01 IP.day - QuickNode: https://faucet.quicknode.com/story"
}


stake() {
  cd storyProtocol/story

  base64Address="$(./story validator export | grep 'Compressed Public Key (base64):' | sed "s/Compressed Public Key (base64): //g")"
  echo "staking 1024 IP on address $base64Address"

  read -p "Confirm staking by Yy:" answer
  case "$answer" in
    "y"|"Y") ./story validator stake --validator-pubkey "$base64Address" --stake 1024000000000000000000 ;;
    *) echo "Aborted" ;;
  esac

  cd ../..
}

if [ -z "$1" ]; then
  usage
  exit 1
else
  case "$1" in
  "install") install_new_instance ;;
  "create") create_validator ;;
  "address") print_addresses ;;
  "update") update_instance ;;
  "start") start_service ;;
  "stop") stop_service ;;
  "logStory") log_story ;;
  "logGeth") log_geth ;;
  "faucet") print_faucet ;;
  "stake") stake ;;
  *) usage ;;
  esac
fi
