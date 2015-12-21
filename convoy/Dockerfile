FROM rancher/os-base:v0.4.3-dev
COPY convoy/convoy /usr/bin/convoy
COPY convoy/convoy-pdata_tools /usr/bin/convoy-pdata_tools
COPY convoy.sh /convoy.sh
CMD ["/convoy.sh"]