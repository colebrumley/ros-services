#!/bin/bash
set -e; set -x

BASEDIR=$(cd $(dirname $0)/..; pwd)

cd $(dirname $0)

for f in $(ls *Dockerfile); do
	cn=${REPO_USER:-elcolio}/os-${PWD##*/}-$(echo $f | sed 's/\.Dockerfile//'):${REPO_TAG:-latest}
	docker build -t $cn -f $f .
	if [[ "$1" == "push" ]]; then docker push $cn; fi
done
