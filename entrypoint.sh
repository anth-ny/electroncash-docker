#!/bin/bash

/usr/local/bin/docker-machine-id-setup
CMD="curl -o run.sh https://raw.githubusercontent.com/anth-ny/electroncash-docker/master/run.sh && sh run.sh"
if [ "$*" == "root shell" ]; then
  exec /bin/bash
fi

mkdir /tmp/runtime-user
chmod 700 /tmp/runtime-user
export XDG_RUNTIME_DIR=/tmp/runtime-user

cd /data
export HOME=/data
$*
