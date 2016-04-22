#!/bin/bash

CMD="unclutter -display :0 -root &"

for i in {1,2,3}{1,2,3}; do
    ssh 192.168.1.$i "$CMD" &
done
