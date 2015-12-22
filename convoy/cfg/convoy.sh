#!/bin/bash
set -e; set -x
echo "unix:///var/run/convoy/convoy.sock" > /etc/docker/plugins/convoy.spec
/opt/bin/convoy daemon --drivers vfs --driver-opts vfs.path=/opt/lib/convoy/volumes
