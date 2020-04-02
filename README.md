# openrc-manager

Manage your OpenStack authentication files (openrc.sh) with ease.

`openrc` is a command wrapper to execute other commands in an environment of OpenStack authentication data.

An alternative of sourcing OpenStack credentials variables into long running shell session. This common practice is prone to leak the data as they are generally held in shell environment for longer time than is necessary or/and injected to processes that does not need them.

## Usage

Run any command with selected openrc.sh injected only for the invocation of specified process.

```bash
# Run `openstack server list` with auth from openrc.sh file named `my-cloud-openrc`
$ openrc my-cloud-openrc openstack server list

# Start interactive shell with auth from `my-other-openrc`
$ openrc my-other-openrc bash
```

Note the latter effectively permit the authentication data to be injected in non-`bash` shells that might not be able to source the openrc.sh as is.

## Adding openrc.sh files

The openrc.sh files are stored in `~/.openrc/files/` directory from where they are sourced when invoked. To add new one, download it from OpenStack and place it in this directory. The file name will be used as the first argument to `openrc`.

## Managing passwords

openrc.sh files, as downloaded from OpenStack, contain code to read password interactively every time it is sourced. This can be impractical when used from openrc-manager as the password needs to be remembered and entered for every invocation.

### Integration with `pass`

Individual openrc.sh files can be modified not to read the password from standard input, but to pull them from a password manager instead. The advantage of this approach is the password is stored encrypted by the password manager and injected exclusively to the processes that need to consume it. The repeated invocation is also simplified since by default, the gpg key used by `pass` is cached in keyring for several minutes causing `openrc` not to ask for master password on subsequent invocations.

Update your openrc.sh like this:
```diff
-echo "Please enter your OpenStack Password for project $OS_PROJECT_NAME as user $OS_USERNAME: "
-read -sr OS_PASSWORD_INPUT
-export OS_PASSWORD=$OS_PASSWORD_INPUT
+export OS_PASSWORD="$(pass show my.opensatck.service/username)"
```

## Command completion

openrc-manager provides command completion to lookup the configured openrc.sh files and the arguments of the wrapped command. Following shell are currently supported:

- BASH
- Fish shell

## Native packages

Packages for following distributions are available:

- [Arch linux](https://aur.archlinux.org/packages/openrc-manager/) (AUR repository)
