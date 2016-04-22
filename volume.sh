#!/bin/bash

CMD="amixer set Master unmute; and amixer -D pulse sset Master $1%"

for i in {1,2,3}{1,2,3}; do
    ssh 192.168.1.$i "$CMD" &
done
