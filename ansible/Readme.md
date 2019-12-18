# Install cluster with ansible

```bash
cp example_hosts.ini hosts.ini

# Edit with own host names and info.
vim hosts.ini

# Run playbook. This script mounts your "~/.ssh" directory in the "ansible/ansible-runner" docker container, so you don't have to install ansible.
./run.sh
```
