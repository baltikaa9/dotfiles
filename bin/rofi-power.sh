#!/bin/bash

entries="⏻ Shutdown\n󰑙 Reboot\n⇠ Logout"

selected=$(echo -e $entries | wofi --width 250 --height 135 -d --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
     hyprctl dispatch exit x;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
