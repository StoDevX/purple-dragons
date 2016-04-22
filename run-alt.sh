#!/bin/bash

D=:0
HOST=http://192.168.1.1:3000
ARGS="--show-fps-counter --no-first-run --fullscreen --kiosk --no-default-browser-check"

ssh 192.168.1.33 "env DISPLAY=$D google-chrome $ARGS \"$HOST/?config=0,180,1440,900\"" &
ssh 192.168.1.23 "env DISPLAY=$D google-chrome $ARGS \"$HOST/?config=0,1080,1440,900\"" &
ssh 192.168.1.11 "env DISPLAY=$D google-chrome $ARGS \"$HOST/?config=0,2160,1440,900\"" &

ssh 192.168.1.32 "env DISPLAY=$D google-chrome $ARGS \"$HOST/?config=1440,0,1920,1080\"" &
ssh 192.168.1.22 "env DISPLAY=$D google-chrome $ARGS \"$HOST/?config=1440,1080,1920,1080\"" &
ssh 192.168.1.12 "env DISPLAY=$D google-chrome $ARGS \"$HOST/?config=1440,2160,1920,1080\"" &

ssh 192.168.1.31 "env DISPLAY=$D google-chrome $ARGS \"$HOST/?config=2360,180,1680,900\"" &
ssh 192.168.1.21 "env DISPLAY=$D google-chrome $ARGS \"$HOST/?config=2360,1080,1440,900\"" &
ssh 192.168.1.13 "env DISPLAY=$D google-chrome $ARGS \"$HOST/?config=2360,2160,1440,900\"" &

