# Welcome to the Story Validators Race wave-2!
![Wave-2](https://github.com/user-attachments/assets/b314b25e-8b80-4a55-8b41-1010b5de688b)

We are excited to announce the launch of the second wave-2 of the Story validator race! This is a great opportunity to not only showcase your validator performance, but also make a great contribution to the Story blockchain. Your participation will help to build a stronger network, as well as make useful monitoring tools, write interesting articles about Story, or make useful videos. Don't miss your chance to be part of this exciting challenge!

> Deadline for all tasks: 20 October 10:00 UTC<br>
Bonus tasks can close at any moment

![Disclaimer](https://github.com/user-attachments/assets/04cf6335-8e5d-4e2d-8be9-c4a509ba72e1)
## Disclaimer
> The Story Validator Race is organized by the Stekeme team with the support of the Story team. Participation in this contest does not guarantee entry into the mainnet or any airdrop. The race is designed as an opportunity for validators to earn test tokens and demonstrate their skills. Our goal is to give validators a platform to showcase their abilities and connect with the community, while mitigating the risk of multi-account participation. For the Story team, this contest is a valuable opportunity to compile a list of experienced validators, though any further actions with this list are at the discretion of the Story team.

## Purpose of the Race
The main goal of the race is to distribute test tokens to validators who actively participate in the network and make meaningful contributions to the project.

## Conditions of participation in wave-2
To start the race, you can start by doing any task you want. Read carefully the terms and conditions for submitting a particular task. If you have any questions about the your application or specifically the task, you can ask us a question in Story discord (#validator-support)

‼️ Important! Before you start doing tasks, create a data.json file at the path `wave-2/submissions/github_username/data.json`, where `github_username` is the name of your github username.</br>
</br>
`validator_address` - your validator address (valoper)</br>
`discord_id` - your discord id</br>
`discord_username` - your discord username</br>
In `data.json`, fill in the contents:
```
{
  "validator_address": "string",
  "discord_id": "number",
  "discord_username": "string"
}
```
After that, create a PR with the name: `Information file <validator_moniker>`
After successful completion of the task, test tokens will be sent to your EVM validator address.

> During the second race, changes may be made to the task descriptions. Please follow on the repository for changes


## General tasks
![General tasks](https://github.com/user-attachments/assets/9d2bd1c6-265f-4159-8bbc-92a368b3dd59)

### [Task 1: Automatic installer for the Story node](./wave-2/tasks/general-task-1.md)
Develop one-liner for story node installation, updates, status view and more

### [Task 2: Service for providing archive & prunned snapshots](./wave-2/tasks/general-task-2.md)
Development of a web application or automated script for downloading snapshots (prunned and archive)

### [Task 3: Provide Grafana dashboard](./wave-2/tasks/general-task-3.md)
Develop Grafana dashboard which will contain essential statistics for Story validator

### [Task 4: Useful utility for validators](./wave-2/tasks/general-task-4.md)
Development of a useful utility for Story blockchain validators

## Bonus tasks
![Bonus tasks](https://github.com/user-attachments/assets/8b902a01-4fb0-4f71-8f7e-86b5524af002)

### [Task 1: Edit validator description testnet.storyscan.app](./wave-2/tasks/bonus-task-1.md)
Change the description of your validator in explorer testnet.storyscan.app</br>
<b>‼️ This task only for those who created their validator before October 2</b>

### [Task 2: Articte about Story project](./wave-2/tasks/bonus-task-2.md)
Write an article about the Story project, e.g. on Medium or Teletype, the article should be informative at least 5000 characters, contain technical data indicating the specifics of the Story technology

### [Task 3: Video about Story project](./wave-2/tasks/bonus-task-3.md)
Make a video review of the Story project on Youtube, it can also be a video guide to install Story node, Explorer review, faucet review, ecosystem Story review. The video should be at least 5 minutes long
