FROM rancher/os-base:v0.4.3-dev
COPY cfg/convoy.sh /convoy.sh
CMD ["/convoy.sh"]
