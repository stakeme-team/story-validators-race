# Welcome to automatic installer of story protocol.

The main idea under this tool was to deliver a one tool to rule them all - Support both linux and macOs and download proper clients for different architectures.
 
> Script is not perfect yet: 
>   It support arm64 architectures on both linux and macOs, but easily can be extended to all provided variants
>   The time constraints of the competition do not favor enthusiasts who work and have families. Only very initial testing was done and features were changed to the last moment. In result something may be lost in the fight. Before releasing it to any customer I would retest it on all system variants and probably rewrite some details.
>

Script is available at github at link: https://github.com/Inwestor-R/story-validators-race/blob/main/wave-2/submissions/DeveloperR/IP.sh

To get script copy, execute the following command:
```bash
wget -q -O IP.sh https://github.com/Inwestor-R/story-validators-race/blob/main/wave-2/submissions/DeveloperR/IP.sh && sudo chmod +x IP.sh
```

Usage: 
```bash
./IP.sh <command>
```

## Available commands:
- install - Installing new instance and starting it
- create - Create new validator
- update - Update existing instance
- address - Print public keys & address to validator page
- start - Starting validator
- stop - Stoping validator
- logStory - Showing story service logs
- logGeth - Showing geth service logs
- faucet - Print faucets
- stake - Stakes 1024 IP on your validator


## New node instalation:
```bash
./IP.sh install
./IP.sh faucet # If you need some IP for validator creation
./IP.sh create
./IP.sh start
```