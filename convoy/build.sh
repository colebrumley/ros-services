#!/bin/bash
set -e; set -x

BASEDIR=$(cd $(dirname $0)/..; pwd)

cd $(dirname $0)

ver=${CONVOY_VERSION:-v0.4.1}
convoy_url=https://github.com/rancher/convoy/releases/download/${ver}/convoy.tar.gz

wget $convoy_url
tar xzvf convoy.tar.gz

for f in $(ls *Dockerfile); do
	docker build -t ${REPO_USER:-elcolio}/os-${PWD##*/}-$(echo $f | sed 's/\.Dockerfile//'):${REPO_TAG:-latest} -f $f .
done

rm -Rf convoy/ convoy.tar.gz
