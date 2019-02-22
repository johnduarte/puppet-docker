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
