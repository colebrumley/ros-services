#!/bin/bash
set -e; set -x

BASEDIR=$(cd $(dirname $0)/..; pwd)
REPO_USER=${REPO_USER:-elcolio}
REPO_TAG=${REPO_TAG:-latest}

export REPO_USER REPO_TAG
cd $(dirname $0)

for d in $(ls -d */); do
	if [[ -x $d/build.sh ]]; then
		./$d/build.sh
	fi
done

set +x
docker login -e $DOCKER_EMAIL -u $DOCKER_REPO_LOGIN -p $DOCKER_PASS
set -x

if [[ "${1}" == "push" ]]; then
	for d in $(ls -d */); do docker push $REPO_USER/os-$(echo ${d} | sed 's/\/$//'):${REPO_TAG}; done
fi
