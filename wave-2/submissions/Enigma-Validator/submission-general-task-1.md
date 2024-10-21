# Story Geth and Story Service Setup with Ansible

[Enigma](https://enigma-validator.com/) propose an automatic installer based on ansible playbook to deploy a story node in one click. 
You can find all information needed in our public [repository](https://github.com/Enigma-Validator/story-ansible) with instructions in the readme file.

## Features

- Downloads and installs Story Geth (version customizable with a variable `GETH_VERSION`).
- Configures and installs two systemd services:
  - **story-geth.service** for the Story Ethereum client.
  - **story.service** for the Story application.
- Initializes the Story network with a customizable moniker.
- Opens required network ports (30303 and 26656) using UFW.

## Prerequisites

Before running this playbook, ensure the following tools and dependencies are installed on your control machine:

### 1. Ansible
- **Installation**: You can install Ansible using `pip` or your package manager.

    ```bash
    pip install ansible
    ```

    Or, on Ubuntu:

    ```bash
    sudo apt update
    sudo apt install ansible
    ```

- **Version requirement**: Ansible 2.9+ is recommended.

### 2. Python
- Ensure you have Python installed on your control machine.
  
  **Installation (Ubuntu)**:

  ```bash
  sudo apt install python3
  ```

  **Version requirement**: Python 3.6+.

### 3. SSH Access
- SSH access must be configured for the remote servers. You should ensure that your SSH key is added and available for password-less login.

### 4. UFW (Uncomplicated Firewall)
- Ensure UFW is installed and enabled on your target machines. The playbook uses UFW to manage firewall rules.

## How to Use

### 1. Clone the Repository

First, clone this repository to your local machine:

```bash
git clone https://github.com/Enigma-Validator/story-ansible.git
cd story-ansible
```

### 2. Edit Your Inventory

Edit the `inventory.ini` file that lists the target servers where the playbook should be executed. For example:

```ini
[story-nodes]
node1 ansible_host=REMOTE_IP ansible_user=USER
```

This file defines the hosts and the SSH users that will be used to connect to them.

### 3. Customize Variables

You can customize variables such as `GETH_VERSION`, `moniker_name`, and `user` when running the playbook. The `GETH_VERSION` specifies which version of Story Geth to install, and the `moniker_name` is used to initialize the Story network.

### 4. Run the Playbook

Run the following command to execute the playbook, specifying the desired version of Geth and moniker name:

```bash
ansible-playbook playbook.yml -i inventory.ini -e geth_version=v0.9.4 -e moniker_name="your-moniker" -e user="your-user"
```

- `inventory.ini`: The inventory file listing the target servers.
- `geth_version`: The version of Story Geth to install (default is `v0.9.4`).
- `moniker_name`: The moniker used for Story network initialization.
- `user`: The system user to run the services under.

### 5. Verify the Installation

After the playbook completes, verify that the services are running:

```bash
sudo systemctl status story-geth
sudo systemctl status story
```

You should see both services running. Additionally, the necessary ports (30303 and 26656) will be open in the firewall.

### 6. Manage Services

You can manage the Story Geth and Story services using `systemctl` commands:

- **Start** the services:

    ```bash
    sudo systemctl start story-geth
    sudo systemctl start story
    ```

- **Stop** the services:

    ```bash
    sudo systemctl stop story-geth
    sudo systemctl stop story
    ```

- **Enable** the services to start automatically on boot:

    ```bash
    sudo systemctl enable story-geth
    sudo systemctl enable story
    ```

## Customization

You can further customize this playbook by modifying the following template files:
- `story-geth.service.j2`: The systemd service configuration for Story Geth.
- `story.service.j2`: The systemd service configuration for the Story application.

These templates include variables such as `{{ user }}`, which are dynamically replaced with values provided when running the playbook.

## Troubleshooting

If you encounter issues during execution:
1. **SSH connection issues**: Ensure the remote servers are accessible via SSH and that your SSH key is properly configured.
2. **Service not starting**: Check the status of the services using `systemctl` and inspect the logs for errors.
3. **Port issues**: Ensure UFW is correctly configured to allow the necessary ports.
