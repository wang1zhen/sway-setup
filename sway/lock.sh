#!/bin/bash

timeout=10

rm -rf /tmp/screen_locaked.png
grimshot save screen - | convert - -blur 0x8 /tmp/screen_locked.png

swayidle \
    timeout $timeout 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

swaylock -i /tmp/screen_locked.png

kill -TERM $!
wait
