#!/bin/bash
set -e; set -x
mkdir -p /var/lib/convoy/volumes /var/run/convoy /etc/docker/plugins || true
echo "unix:///var/run/convoy/convoy.sock" > /etc/docker/plugins/convoy.spec
convoy daemon --drivers vfs --driver-opts vfs.path=/var/lib/convoy/volumes
