#!/bin/bash
set -e; set -x

BASEDIR=$(cd $(dirname $0)/..; pwd)

cd $(dirname $0)

docker build -t ${REPO_USER}/os-weave:${REPO_TAG} .