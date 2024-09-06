#!/bin/bash
GREEN=$'\e[32m'
RED=$'\e[31m'
YELLOW=$'\e[33m'
RESET=$'\e[0m'

DONE="[done]"
BUSY="[busy]"
FAILED="[failed]"

TOTAL_STEPS=10
CURRENT_STEP=1
ALL_TESTS_PASSED=true

display_step_status() {
    local step_msg=$1
    local step_status=$2
    local color=$3
    echo -ne "\r\033[K${CURRENT_STEP}/${TOTAL_STEPS} : ${step_msg} ${color}${step_status}${RESET}"
}

set_test_status() {
    local status=$1
    if [ "$status" = "failed" ]; then
        ALL_TESTS_PASSED=false
    fi
}

install_jq() {
  check_jq_installed() {
    if ! command -v jq &> /dev/null; then
      return 1
    else
      return 0
    fi
  }

  display_step_status "Checking if jq is installed" "$BUSY" "$YELLOW"

  local OS="$(uname -s)"
  if [[ "$OS" == "Linux" ]]; then
    if command -v apt-get &> /dev/null; then
      if check_jq_installed; then
        display_step_status "jq already installed" "$DONE" "$GREEN"
      else
        sudo apt-get update > /dev/null
        sudo apt-get install -y jq > /dev/null
        if check_jq_installed; then
          display_step_status "jq installed successfully" "$DONE" "$GREEN"
        else
          display_step_status "jq installation failed" "$FAILED" "$RED"
          set_test_status "failed"
          echo
          exit 1
        fi
      fi
    else
      echo "This is not Ubuntu or the system does not use apt."
      exit 1
    fi
  elif [[ "$OS" == "Darwin" ]]; then
    if check_jq_installed; then
      display_step_status "jq already installed" "$DONE" "$GREEN"
    else
      if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      fi
      brew install jq
      if check_jq_installed; then
        display_step_status "jq installed successfully" "$DONE" "$GREEN"
      else
        display_step_status "jq installation failed" "$FAILED" "$RED"
        set_test_status "failed"
        echo
        exit 1
      fi
    fi
  else
    echo "Unsupported operating system: $OS"
    exit 1
  fi

  echo
}

echo "
  ___ _____ ___  _____   __
 / __|_   _/ _ \| _ \ \ / /
 \__ \ | || (_) |   /\ V /
 |___/ |_| \___/|_|_\ |_|

created checker validator team @stakeme
"

install_jq
CURRENT_STEP=$((CURRENT_STEP + 1))

echo "> Please enter the Cosmos RPC URL of the node: (ex. https://story-testnet-rpc.stakeme.pro)"
read -r RPC_URL

RPC_STATUS_URL="$RPC_URL/status"

display_step_status "Checking Cosmos network (iliad-0)" "$BUSY" "$YELLOW"

response=$(curl -s $RPC_STATUS_URL)

cosmos_network=$(echo $response | jq -r '.result.node_info.network')

if [ "$cosmos_network" != "iliad-0" ]; then
    display_step_status "Cosmos network is not iliad-0 (current value: $cosmos_network)" "$FAILED" "$RED"
    set_test_status "failed"
    echo
    exit 1
else
    display_step_status "Cosmos network is iliad-0" "$DONE" "$GREEN"
    echo
fi

CURRENT_STEP=$((CURRENT_STEP + 1))

display_step_status "Checking earliest_block_height" "$BUSY" "$YELLOW"

earliest_block_height=$(echo $response | jq -r '.result.sync_info.earliest_block_height')

if [ "$earliest_block_height" != "1" ]; then
    display_step_status "earliest_block_height is not 1 (current value: $earliest_block_height)" "$FAILED" "$RED"
    set_test_status "failed"
    echo
    exit 1
else
    display_step_status "earliest_block_height equal 1" "$DONE" "$GREEN"
    echo
fi

CURRENT_STEP=$((CURRENT_STEP + 1))

display_step_status "Checking tx_index (should be 'on')" "$BUSY" "$YELLOW"

tx_index=$(echo $response | jq -r '.result.node_info.other.tx_index')

if [ "$tx_index" != "on" ]; then
    display_step_status "tx_index is not on (current value: $tx_index)" "$FAILED" "$RED"
    set_test_status "failed"
    echo
    exit 1
else
    display_step_status "tx_index is on" "$DONE" "$GREEN"
    echo
fi

CURRENT_STEP=$((CURRENT_STEP + 1))
display_step_status "Checking Cosmos node synchronization (catching_up)" "$BUSY" "$YELLOW"

catching_up=$(echo $response | jq -r '.result.sync_info.catching_up')

if [ "$catching_up" = "false" ]; then
    display_step_status "Cosmos node is synchronized (catching_up: false)" "$DONE" "$GREEN"
    echo
else
    display_step_status "Cosmos node is still catching up (catching_up: true)" "$FAILED" "$RED"
    set_test_status "failed"
    echo
    exit 1
fi

CURRENT_STEP=$((CURRENT_STEP + 1))
echo "> Please enter the EVM JSON RPC URL (ex. https://story-testnet-evm-rpc.stakeme.pro)"
read -r EVM_RPC_URL

display_step_status "Checking EVM Chain ID" "$BUSY" "$YELLOW"

evm_chain_id_response=$(curl -s -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_chainId","params":[],"id":1}' $EVM_RPC_URL)

chain_id=$(echo $evm_chain_id_response | jq -r '.result')

expected_chain_id="0x5e9"
if [ "$chain_id" != "$expected_chain_id" ]; then
    display_step_status "EVM Chain ID is incorrect (current value: $chain_id)" "$FAILED" "$RED"
    set_test_status "failed"
    echo
    exit 1
else
    display_step_status "EVM Chain ID is correct" "$DONE" "$GREEN"
    echo
fi

CURRENT_STEP=$((CURRENT_STEP + 1))

display_step_status "Checking EVM JSON RPC" "$BUSY" "$YELLOW"

evm_response=$(curl -s -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x1",false],"id":0}' $EVM_RPC_URL)

block_hash=$(echo $evm_response | jq -r '.result.hash')

expected_hash="0x85c762933fc6600a200ced1985e238f31536ce7448772e2d0c2aba2e8b510993"
if [ "$block_hash" != "$expected_hash" ]; then
    display_step_status "EVM block hash is incorrect (current value: $block_hash)" "$FAILED" "$RED"
    set_test_status "failed"
    echo
    exit 1
else
    display_step_status "EVM block hash is correct" "$DONE" "$GREEN"
    echo
fi

CURRENT_STEP=$((CURRENT_STEP + 1))

echo "> Please enter the Cosmos REST API URL (ex. https://story-testnet-rest.stakeme.pro)"
read -r REST_URL

display_step_status "Checking Cosmos REST API" "$BUSY" "$YELLOW"

rest_response=$(curl -s "$REST_URL/upgrade/module_versions")

expected_rest_response='{"code":200,"msg":{"module_versions":[{"name":"auth","version":"5"},{"name":"bank","version":"4"},{"name":"consensus","version":"1"},{"name":"distribution","version":"3"},{"name":"evmengine","version":"1"},{"name":"evmstaking","version":"1"},{"name":"genutil","version":"1"},{"name":"gov","version":"5"},{"name":"mint","version":"2"},{"name":"runtime"},{"name":"slashing","version":"4"},{"name":"staking","version":"5"},{"name":"upgrade","version":"2"}]},"error":""}'

if [[ "$rest_response" == "$expected_rest_response" ]]; then
    display_step_status "Cosmos REST API returned expected result" "$DONE" "$GREEN"
    echo
else
    display_step_status "Cosmos REST API response does not match expected result" "$FAILED" "$RED"
    set_test_status "failed"
    echo
    exit 1
fi

CURRENT_STEP=$((CURRENT_STEP + 1))

echo "> Please enter the Cosmos WebSocket URL (ex. wss://story-testnet-rpc.stakeme.pro/websocket)"
read -r COSMOS_WS_URL

display_step_status "Cosmos WebSocket URL saved (please check WebSocket connection manually)" "$DONE" "$GREEN"
echo

CURRENT_STEP=$((CURRENT_STEP + 1))

echo "> Please enter the EVM WebSocket URL (ex. wss://story-testnet-evm-rpc.stakeme.pro)"
read -r EVM_WS_URL

display_step_status "EVM WebSocket URL saved (please check WebSocket connection manually)" "$DONE" "$GREEN"
echo

tests_status="ok"
if [ "$ALL_TESTS_PASSED" = false ]; then
    tests_status="failed"
fi

checked_timestamp=$(date +%s)
echo "Paste the content into data.json
{
  \"cosmos_rpc\": \"$RPC_URL\",
  \"evm_json_rpc\": \"$EVM_RPC_URL\",
  \"cosmos_rest\": \"$REST_URL\",
  \"cosmos_ws\": \"$COSMOS_WS_URL\",
  \"evm_ws\": \"$EVM_WS_URL\",
  \"tests\": \"$tests_status\",
  \"timestamp\": $checked_timestamp
}
"
