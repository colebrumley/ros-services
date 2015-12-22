#!/bin/bash
set -e; set -x
mkdir -p /opt/lib/convoy/volumes /opt/bin /var/{lib,run}/convoy /etc/docker/plugins || true
rm -f /convoy/SHA* ; mv /convoy/* /opt/bin/
echo "unix:///var/run/convoy/convoy.sock" > /etc/docker/plugins/convoy.spec
/opt/bin/convoy daemon --drivers vfs --driver-opts vfs.path=/opt/lib/convoy/volumes
