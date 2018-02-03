#!/bin/bash

export XDG_RUNTIME_DIR=/tmp/runtime-user
timeout 3 /usr/local/bin/electron-cash
/usr/local/bin/electron-cash
