#!/bin/sh
while :
do
    player_status=$(playerctl status 2> /dev/null)
    if [ "$player_status" = "Playing" ]; then
        echo "$(playerctl metadata title) - $(playerctl metadata artist)"
    elif [ "$player_status" = "Paused" ]; then
        echo " $(playerctl metadata title) - $(playerctl metadata artist)"
    fi
done
