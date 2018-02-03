#!/bin/bash

su -c "timeout 3 /usr/local/bin/electron-cash" user
su -c /usr/local/bin/electron-cash user
