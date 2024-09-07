#!/bin/bash
GREEN=$'\e[32m'
RED=$'\e[31m'
YELLOW=$'\e[33m'
RESET=$'\e[0m'

DONE="[done]"
BUSY="[busy]"
FAILED="[failed]"

main() {
echo "
  ___ _____ ___  _____   __
 / __|_   _/ _ \| _ \ \ / /
 \__ \ | || (_) |   /\ V /
 |___/ |_| \___/|_|_\ |_|

created checker validator team @stakeme
"

    echo "> Please enter your moniker validator"
    read -r MONIKER

    echo "> Please enter your signature"
    read -r SIGNATURE

    echo "> Please enter your wallet EVM address"
    read -r EVM_WALLET

    checked_timestamp=$(date +%s)
    echo "Paste the content into data.json
    {
      \"moniker\": \"$MONIKER\",
      \"signature\": \"$SIGNATURE\",
      \"evm_wallet\": \"$EVM_WALLET\",
      \"timestamp\": $checked_timestamp
    }
    "
}

main
