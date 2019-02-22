# Managing Docker with Puppet
Ref: https://www.linuxjournal.com/content/managing-docker-instances-puppet

## Usage
This repo includes a `Vagrantfile` and `docker.pp` puppet manifest. To
facilitate provisioning a VM that used puppet to manage docker a container.
This container runs an instance of the apache webserver.  The container's port
80 is mapped to port 8080 on the local vagrant VM.  If this port is unused on
the host machine, it will also be mapped to port 8080 on the local machine.

With these two files, the end result of a containerized apache instance
port mapped to localhost is achieved with the following commands.  In
the example below the `local` hostname refers to commands run from your
development environment.

```
local:~$ vagrant up      # this provisions an Ubuntu 18.04 VM.
                         # Puppet and required modules are installed.  Then
                         # puppet manifest is applied to realize the docker
                         # container resource.
```


## Role and Profiles
This repo includes a `roles_and_profiles.pp` puppet manifest to illustrate how
these abstraction concepts can allow different resource deployments merely
based on the hostname.  This is an all in one file which includes the profile
classes, the role classes, and the node classification.

To utilize this file you need to change the hostname of the VM.  This is done
using the included `change_hostname` script.  Choose a hostname that contains
`apline33` or `alpine34` to see the defined classifications in action.  If you
choose a name without these strings the manifest will complain that your
hostname cannot be classified.

Here is an example.  All of the commands are performed on the VM managed by
vagrant.
```
/vagrant/change_hostname foo-alpine33
sudo puppet apply /vagrant/roles_and_profiles.pp
```
