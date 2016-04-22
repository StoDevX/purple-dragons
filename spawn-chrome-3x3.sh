#!/bin/bash

w=1920
h=1080

for i in 1 2 3; do
	for j in 1 2 3; do
		x=$(echo "($i - 1) * $w" | bc)
		y=$(echo "($j - 1) * $h" | bc)
		params="$x,$y,$w,$h"
		echo $params
		#ssh 192.168.1.$i$j "env DISPLAY=:0 google-chrome --kiosk \"http://192.168.1.1:3000/?config=$params\" &"
	done
done
