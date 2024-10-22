

# Submission-General-Task-2

**Service for providing archive & prunned snapshots**


## Snapsots Installation Command

To install the necessary Snapsots for managing your Story Protocol node, run the following command in your terminal:

```bash
cd $HOME && wget https://raw.githubusercontent.com/CryptoBureau01/Story-Node/main/update-snapshots.sh && chmod +x update-snapshots.sh && ./update-snapshots.sh
```

### Sources Repository:
[Story-Node-Tool Setup Script](https://github.com/CryptoBureau01/Story-Node/blob/main/update-snapshots.sh)  



## Summary of the Script

This script automates the process of managing snapshots for the Story and Geth blockchain nodes. It includes the following main functionalities:

### Colorful Message Functions:
- **`print_info()`**: Prints messages in green for informational purposes.
- **`print_error()`**: Prints error messages in red.

### Root Check:
- The script checks if it's being run as the root user. If not, it displays an error message and exits.

### Package Installation:
- It installs the necessary packages `lz4` and `wget` using `apt-get`, ensuring they are available for later use.

### Backup of Private Key:
- It checks for the existence of the `priv_validator_state.json` private key file. If found, it backs it up; if not, it notifies the user.

### User Confirmation for Data Deletion:
- A function **`confirm_deletion()`** prompts the user to confirm whether they want to delete existing data.

### Snapshot Management:
- Users can choose between two options: **Archive** and **Pruned** snapshots.
- Depending on the user's choice, the script downloads the selected snapshot (either for Story or Geth) and extracts it to the appropriate directory.
- It deletes any old snapshots before downloading new ones and cleans up after extraction.

### Restoration of Private Key:
- After downloading and extracting the snapshots, it checks for a backup of the `priv_validator_state.json` file to restore it if available.

### User Prompt:
- At the end, the script prompts the user to choose between **Archive**, **Pruned**, or **Exit** options to proceed accordingly.

## User Flow:
- The user is prompted to choose between two types of snapshots.
- Depending on their choice, the script performs the necessary operations to manage snapshots, ensuring data integrity by backing up and restoring the private key as needed.
- The process concludes with a success message upon completion of the snapshot synchronization.

## Sync Status Check: 
- The function uses the /status API endpoint to get the node's sync information.

This script is useful for users managing blockchain nodes, ensuring that the process of handling snapshots is efficient and user-friendly.



### Sources Repository:
[Story-Node-Tool Setup Script](https://github.com/CryptoBureau01/Story-Node/blob/main/update-snapshots.sh) 

