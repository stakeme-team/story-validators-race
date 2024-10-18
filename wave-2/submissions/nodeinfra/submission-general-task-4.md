# Submission for General Task 4: Useful utility for validators

## GitHub Repository
https://github.com/s3unghyeon/story_setup

## Utility Description
This utility is a Python script designed to track and analyze Story Staking method transactions on the Story blockchain. It allows validators to retrieve detailed information about staking transactions, including where validators have staked their tokens.

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/s3unghyeon/story_setup.git
   cd story_setup/task4
   ```

2. Install required dependencies:
   ```
   pip3 install -r requirements.txt
   ```

## Usage

1. Navigate to the task4 folder:
   ```
   cd /path/to/story_setup/task4
   ```

2. Run the script:
   ```
   python3 txAnalysis.py
   ```

3. When prompted, enter the starting and ending block numbers to analyze. Enter '0' for the ending block to analyze up to the latest block.

4. The script will process the specified block range and output the results, including:
   - Number of staking transactions found
   - Block range analyzed
   - Time taken for analysis

5. Detailed results will be saved in a JSON file named `story_tx_analysis_[timestamp].json` in the same directory.

## Key Features

1. **Asynchronous Processing**: Utilizes asyncio and aiohttp for efficient, non-blocking network requests, allowing for faster analysis of large block ranges.

2. **Targeted Transaction Analysis**: Focuses on transactions involving the Story Staking method, identified by a specific method signature.

3. **Detailed Transaction Information**: Captures comprehensive data for each relevant transaction, including:
   - Transaction hash
   - Block number
   - From and To addresses
   - Transaction value
   - Gas information
   - Input data

4. **Progress Tracking**: Displays real-time progress during the analysis process.

5. **Results Export**: Saves detailed transaction data to a JSON file for further analysis or record-keeping.

6. **Flexible Block Range**: Allows users to specify custom block ranges for analysis, accommodating various timeframes and historical data needs.

This utility provides validators with valuable insights into staking activities on the Story blockchain, helping them track and analyze staking patterns, validator behaviors, and network participation.