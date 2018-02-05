#!/bin/bash

if test -z "$DISPLAY" ; then
  echo "Warning: DISPLAY not set; try --env DISPLAY"
fi
DIR=/tmp/.X11-unix
if [ ! -d "$DIR" ]; then
  echo "Warning: $DIR doesn't exist; try --volume $DIR:$DIR"
fi

mkdir -p /data/.electron-cash
ln -s /data/.electron-cash /home/user/

timeout 3 /usr/local/bin/electron-cash
/usr/local/bin/electron-cash
