#!/bin/bash

dbus-uuidgen >/etc/machine-id
CMD="curl -o run.sh https://raw.githubusercontent.com/anth-ny/electroncash-docker/master/run.sh && sh run.sh"
if [ "$*" == "root shell" ]; then
  exec /bin/bash
fi
if ! test "$UID" -gt 0 2>/dev/null ; then
  echo "bad UID ($UID)"
  echo 'add -e UID=`id -u $USER` -e GID=`id -g $USER`'
  echo "$CMD"
  exit
fi
if ! test "$GID" -gt 0 2>/dev/null ; then
  echo "bad GID ($GID)"
  echo 'add -e UID=`id -u $USER` -e GID=`id -g $USER`'
  echo "$CMD"
  exit
fi
groupadd -g $GID -r user && \
useradd -u $UID --create-home --no-log-init -r -g user user && \

gosu user mkdir /tmp/runtime-user
gosu user chmod 700 /tmp/runtime-user
export XDG_RUNTIME_DIR=/tmp/runtime-user

exec /usr/sbin/gosu user $*
