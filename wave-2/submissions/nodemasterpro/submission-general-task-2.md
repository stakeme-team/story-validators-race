# Task 2: Providing Snapshot Download and Import Service

I used the `snapshot_manager.sh` script to download and import snapshots of the Story node, which significantly reduced sync time compared to starting from scratch.

## Using the Snapshot Manager

### Downloading a Snapshot

I downloaded a pruned snapshot using:

```
./snapshot_manager.sh download pruned
```

For a complete archive snapshot, I used:

```
./snapshot_manager.sh download archive
```

### Importing a Snapshot

After downloading, I imported the snapshot to my node:

For a pruned snapshot:
```
./snapshot_manager.sh import pruned
```

For an archive snapshot:
```
./snapshot_manager.sh import archive
```

These commands performed the following:
- Stopped the Story services
- Imported the downloaded snapshot
- Restarted the services

The snapshot functionality allowed my node to catch up with the network quickly and efficiently. This is particularly useful for new node operators or those who need to resync their nodes after a long period of inactivity.

## Technical Details

The snapshot download and import process involves several key steps:

1. Backing up the `priv_validator_state.json` file to preserve important validator state information.

2. Removing old data to prepare for the new snapshot import.

3. Extracting the downloaded Story and Geth snapshots to their respective directories.

4. Restoring the backed-up `priv_validator_state.json` file to maintain validator continuity.

This snapshot management feature greatly simplifies the process of deploying and maintaining Story nodes, allowing node operators to save considerable time during initial setup or resynchronization.
