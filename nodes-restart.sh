#!/bin/bash

CMD="echo p | sudo -S shutdown -r now"

for i in {1,2,3}{1,2,3}; do
    ssh 192.168.1.$i "$CMD" &
done
