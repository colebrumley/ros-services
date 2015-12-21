#!/bin/bash
set -e; set -x
mkdir -p /var/lib/docker/convoy-volumes /var/lib/convoy /etc/docker/plugins /var/run/convoy || true
echo "unix:///var/run/convoy/convoy.sock" > /etc/docker/plugins/convoy.spec
/usr/bin/convoy daemon --drivers vfs --driver-opts vfs.path=/var/lib/docker/convoy-volumes