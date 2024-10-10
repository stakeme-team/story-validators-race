# Story Validators Race

## Task 2: Launch Archive Node

In this task, you will install and run an archive node on the iliad testnet. This task demonstrates your ability to deploy a node effectively.

### Assignment criteria:
- **Story (Cosmos-layer) node**: The node must store the first block (`earliest_block_height: 1`). Also must be tx_index: on
- **Story Geth (EVM-layer) node**: The node must store the first block.
- **Public RPC Access**: The RPC must be publicly accessible. Using a CDN with a proxy is allowed. Maintaining high RPC uptime is crucial, as the checking system will periodically send requests to verify availability.

You can use our checker to validate your node’s availability:

```bash
bash <(curl -s https://raw.githubusercontent.com/stakeme-team/story-validators-race/main/tasks/task2/checker_task2.sh)
```
## Submission

Continue working in your forked repository.
Create a folder named after your github_username, then create a folder task2 within it.
Inside the task2 folder, create a file named data.json and paste the output of the checker_task2.sh script.</br>
Example of the data.json format:
```json
{
  "cosmos_rpc": "string",
  "evm_json_rpc": "string",
  "tests": "string",
  "timestamp": number
}
```

File structure should look like this:
```bash
├── submissions
│   └── github_username
│       ├── task1
│       │   └── README.md
│       ├── task2
│       │   └── data.json
│       └── user.json
```
Create a Pull Request (PR) with your submission.
> Once your Task 2 submission is approved, you can proceed to Task 3.
