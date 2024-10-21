:key:  **Have you lost your `priv_validator_key.json` file and want to recover your validator?**

 We have created a tool so as to recreate the file. Fortunately, Story Protocol's design allows this to be done in case one keeps its validator account private key but not its `priv_validator_key.json` file.

:bangbang: Note that you will need at least to identify your validator in an explorer to proceed and get success.

:zap: **One-liner** ```bash <(curl -s https://raw.githubusercontent.com/McDaan/general/refs/heads/main/story/lostmyvalidator.sh)```

Bash code: https://github.com/McDaan/general/blob/main/story/lostmyvalidator.sh

![Lost my validator](https://github.com/McDaan/general/blob/main/story/lostmyvalidator.gif)
