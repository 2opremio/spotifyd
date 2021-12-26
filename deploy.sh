#!/bin/bash

./cross-rpi.sh --features dbus_mpris --release 
ssh duchamp sudo systemctl stop spotifyd
scp duchamp/armv7-unknown-linux-gnueabihf/release/spotifyd duchamp:
ssh duchamp sudo systemctl start spotifyd

ssh duchamp journalctl -u spotifyd.service -f
