#!/bin/bash

D=:0
ARGS="--enable-low-end-device-mode --enable-gpu-rasterization --ignore-gpu-blacklist --disable-translate --show-fps-counter --no-first-run --fullscreen --kiosk --no-default-browser-check"

ssh 192.168.1.33 "env DISPLAY=$D google-chrome $ARGS \"https://www.youtube.com/watch?v=czFqCdNRHqQ\"" &
ssh 192.168.1.23 "env DISPLAY=$D google-chrome $ARGS \"https://www.youtube.com/watch?v=dmPrfYkpwTY\"" &
ssh 192.168.1.11 "env DISPLAY=$D google-chrome $ARGS \"https://www.youtube.com/watch?v=lAxgztbYDbs\"" &

ssh 192.168.1.32 "env DISPLAY=$D google-chrome $ARGS \"https://www.youtube.com/watch?v=PFWAOnvMd1Q\"" &
ssh 192.168.1.22 "env DISPLAY=$D google-chrome $ARGS \"http://gamelika.com/imaginator/1/4e5fb9d743d5f_da2baab6e007.gif\"" &
ssh 192.168.1.12 "env DISPLAY=$D google-chrome $ARGS \"https://www.youtube.com/watch?v=CQAX-YwX6iM\"" &

ssh 192.168.1.31 "env DISPLAY=$D google-chrome $ARGS \"https://www.youtube.com/watch?v=JYLdTuL9Wjw\"" &
ssh 192.168.1.21 "env DISPLAY=$D google-chrome $ARGS \"https://www.youtube.com/watch?v=_EC2tmFVNNE\"" &
ssh 192.168.1.13 "env DISPLAY=$D google-chrome $ARGS \"https://www.youtube.com/watch?v=5NYt1qirBWg\"" &

