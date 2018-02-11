#!/bin/bash

if [ ! -f /tmp/apt-get-update-done ]; then
    apt-get update
    touch /tmp/apt-get-update-done
elif test `find "/tmp/apt-get-update-done" -mmin +120`; then
    apt-get update
    touch /tmp/apt-get-update-done
else
    echo no need to apt-get update
fi
