#!/bin/bash

./cross-rpi.sh --features dbus_mpris --release 
ssh rpi4 sudo supervisorctl stop spotifyd
scp target/armv7-unknown-linux-gnueabihf/release/spotifyd rpi4:
ssh rpi4 sudo supervisorctl start spotifyd

ssh rpi4 tail -f /var/log/spotifyd.log
