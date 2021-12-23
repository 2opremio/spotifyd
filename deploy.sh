#!/bin/bash

./cross-rpi.sh --features dbus_mpris --release 
ssh rpi4 sudo supervisorctl stop spotifyd
scp  rpi4:
ssh rpi sudo supervisorctl start spotifyd

ssh rpi tail -f /var/log/spotifyd.log
