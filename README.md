### Ansible inventory to ssh config
This script assembles ssh config from ansible inventory hosts file.
You can redirect script's stdout to ssh config file.

### Run
```sh
./ansible_inventory_to_ssh_config.sh ~/ansible_inventory > ~/.ssh/config.d/ansible
```

### Configure ssh client
You need to add `Include ~/.ssh/config.d/*` to your ssh client config.
Then you can connect to new hosts as usual:
```sh
ssh my_ansible_host
```
