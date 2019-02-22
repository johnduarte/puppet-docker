# Be sure to install the 'puppet-docker' module first.

# Most Vagrant boxes use 'vagrant' rather than
# 'ubuntu' as the default username.  For our Ubuntu
# host we wil both just in case.
class { 'docker':
  docker_users => ['ubuntu','vagrant'],
}

# Install an Apache2 image based on Alpine Linux.
# Use port forwarding to map port 8080 on the
# Docker host to port 80 inside the container.
docker::run { 'apache2':
  image   => 'httpd:alpine',
  ports   => ['8080:80'],
  require => Class['docker'],
}
