#!/bin/sh

./start-server-3x3.sh --playlist ~/purple-dragons/playlist.json &
sleep 3
./run.sh &
