# openrc-manager

Manage your OpenStack openrc files with ease.

## Usage

Run any command with selected openrc sourced.

```bash
# Run command with auth from given openrc (`openstack server list` in this case)
$ openrc my-cloud-openrc openstack server list

# Start interactive shell with desired auth set
$ openrc my-other-openrc bash
```

## Adding `openrc` files

The openrc files are storred in `~/.openrc/files/` directory from where they are sourced when needed.
