#!/usr/bin/env bash
DIR=$(pwd)
docker run -i --rm -v "${DIR}":"${DIR}" -e XDEBUG_CONFIG="remote_host=172.17.0.1" -v /tmp/:/tmp/ -w ${DIR} --net=host --sig-proxy=true --pid=host <image> php --ini && php "$@"
