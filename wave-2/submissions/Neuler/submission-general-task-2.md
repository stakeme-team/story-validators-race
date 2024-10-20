# Snapshot Installation Script

This script automates the installation of Geth and Story snapshots from two endpoints for pruned and archive data.

## Features
- Fetches latest and timestamped snapshots from:
  - Geth
  - Story
- Default selection for the latest snapshots
- Option to select specific timestamped snapshots
- Downloads and installs the selected snapshot for both Geth and Story nodes

## Prerequisites
- Ubuntu/Debian-based system

## Dependencies 
- `aria2` and `lz4` are installed by the script for faster downloads and decompression

## Usage
```bash 
wget https://raw.githubusercontent.com/neulerfzco/story-wave2-2-snapshot/refs/heads/main/snapshot_installer.sh 
chmod +x snapshot_installer.sh 
./snapshot_install.sh 
```
   
