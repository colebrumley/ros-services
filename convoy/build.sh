#!/bin/bash
set -e; set -x

BASEDIR=$(cd $(dirname $0)/..; pwd)

cd $(dirname $0)

ver=${CONVOY_VERSION:-v0.4.1}
convoy_url=https://github.com/rancher/convoy/releases/download/${ver}/convoy.tar.gz

wget -O- $convoy_url | tar xzv -

docker build -t ${REPO_USER}/os-convoy:${REPO_TAG} .

rm -Rf convoy