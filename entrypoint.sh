#!/bin/bash

export XDG_RUNTIME_DIR=/tmp/runtime-user
dbus-uuidgen >/etc/machine-id
DIR="/data/.electron-cash"
CMD="curl https://raw.githubusercontent.com/anth-ny/electroncash-docker/master/run.sh && sh run.sh"
if [ ! -d "$DIR" ]; then
  echo "$DIR doesn't exist"
  echo "$CMD"
  exit
fi
USER_ID=`stat -c '%u' $DIR`
if [ "$USER_ID" -lt "500" ]; then
  echo "bad user id on $DIR"
  echo "$CMD"
  exit
fi
GROUP_ID=`stat -c '%g' $DIR` && \
if [ "$USER_ID" -lt "500" ]; then
  echo "bad group id on $DIR"
  echo "$CMD"
  exit
fi
groupadd -g $GROUP_ID -r user && \
useradd -u $USER_ID --create-home --no-log-init -r -g user user && \
ln -s /data/.electron-cash /home/user/
mkdir /tmp/runtime-user && \
chown user:user /tmp/runtime-user && \
chmod 700 /tmp/runtime-user
if [ "$*" == "/electron-cash.sh" ]; then
  exec $*
fi
if [ "$*" == "root shell" ]; then
  exec /bin/bash
fi
if [ "$*" == "shell" ]; then
  exec su - user
fi
if [ "$*" == "sleep" ]; then
  exec sleep infinity
fi

echo "valid commands are 'shell', 'root shell', and 'sleep'"
echo "or leave blank to run electron-cash"
