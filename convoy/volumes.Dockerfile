FROM rancher/os-base:v0.4.3-dev
COPY convoy/convoy /usr/bin/convoy
COPY convoy/convoy-pdata_tools /usr/bin/convoy-pdata_tools
VOLUME /var/run/convoy
VOLUME /var/lib/convoy
# VOLUME /usr/bin/convoy
# VOLUME /usr/bin/convoy-pdata_tools
