#!/bin/bash
set -e;set -x
RANGE=${WEAVE_IPALLOC_RANGE:-10.101.0.0/16}
NET=${WEAVE_DEFAULT_SUBNET:-10.0.0.0/8}
PW=${WEAVE_PASSWORD:-this_is.NOT-a-S3cur3_password}
VSN=${WEAVE_VERSION:-v1.4.0}

mkdir -p /opt/bin
wget -O /opt/bin/weave https://github.com/weaveworks/weave/releases/download/${VSN}/weave
chmod a+x /opt/bin/weave
/opt/bin/weave setup

set +e
for (( i = 0; i < 10; i++ )); do
	/opt/bin/weave launch --ipalloc-range ${RANGE} --ipalloc-default-subnet ${NET} --password ${PW}
	if [[ $? ]]; then
		exit 0
	fi
	sleep 2
done
