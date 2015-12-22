#!/bin/bash
set -e; set -x
mkdir -p /opt/lib/convoy/volumes /opt/bin /var/{lib,run}/convoy /etc/docker/plugins || true
mv /convoy/convoy /opt/bin/convoy || true
mv /convoy/convoy-pdata_tools /opt/bin/convoy-pdata_tools || true
echo "unix:///var/run/convoy/convoy.sock" > /etc/docker/plugins/convoy.spec
/opt/bin/convoy daemon --drivers vfs --driver-opts vfs.path=/opt/lib/convoy/volumes
