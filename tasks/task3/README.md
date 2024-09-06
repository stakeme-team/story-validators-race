# Story validators race

## Task 3: Provide public endpoints of the archive node
After archive node successfully launching, you will have to provision the public endpoints. So that's needed other users to interact with your node, starting from the first block.
### Assignment Criteria:
- **Story (Cosmos-layer) Node**: Your Cosmos node must store the first block (`earliest_block_height: 1`) and have `tx_index` set to `on`.
- **Story Geth (EVM-layer) Node**: Your EVM node must store the first block.
- **Public RPC Access**: Both Cosmos and EVM RPC endpoints must be publicly accessible. Using a CDN with a proxy is allowed. Maintaining high RPC uptime is crucial, as the checking system will periodically send requests to verify the availability of your node.
- **Cosmos REST API**: You should provide Cosmos REST API.
- **WebSocket URLs**: You should provide WebSocket URLs for both Cosmos and EVM layers.
### Checking Your Node
You can use our checker script to validate your node’s availability:
```bash
bash <(curl -s https://raw.githubusercontent.com/stakeme-team/story-validators-race/main/tasks/task3/checker_task3.sh)
```

## Submission
Continue working in your forked repository.
In folder folder named after your GitHub username inside the submissions directory.
Inside this folder, create a subfolder named task3.
Run the checker_task3.sh script and save the output into a data.json file.
Paste the following format into the data.json file:
```json
{
  "cosmos_rpc": "string",
  "evm_json_rpc": "string",
  "cosmos_rest": "string",
  "cosmos_ws": "string",
  "evm_ws": "string",
  "tests": "string",
  "timestamp": number
}
```

Your folder structure should look like this:
```bash
├── submissions
│   └── github_username
│       ├── task1
│       │   └── README.md
│       ├── task2
│       │   └── data.json
│       ├── task3
│       │   └── data.json
│       └── user.json
```
Create a Pull Request (PR) with your submission.
Once your Task 3 submission is approved, you can proceed to Task 4
> Notes:
Make sure that your nodes have stable public RPC access with uptime.
WebSocket connections should be verified manually, and their URLs included in the final submission.
