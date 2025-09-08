#!/usr/bin/bash

dayImg="$HOME/Pictures/wallpapers/Forest-Light.png"
nightImg="$HOME/Pictures/wallpapers/Forest-Dark.png"

secondImg="$HOME/Pictures/wallpapers/minecraft_sakura.gif"

hours=$(date +%k)

if (( hours >= 6 && hours < 18 )); then
  img="$dayImg"
else 
  img="$nightImg"
fi

# sleep 1

# while [ true ]; do
  # if [ -S "${XDG_RUNTIME_DIR}/swww-wayland-1.sock" ]; then
  # if pgrep -x "swww-daemon"; then
    # break 
  # fi
# done

# status=1
#
# while [ $status ]; do
#   swww img $img -o DP-2
#   status=$?
#   echo $status
# done

# until swww img $img -o DP-2; do :; done

# exit $?

max_wait=30
count=0

while ! swww query 2>/dev/null && [ $count -lt $max_wait ]; do
    sleep 1
    count=$((count + 1))
done

if swww query 2>/dev/null; then
    swww img "$img" -o DP-2
else
  echo "Ошибка: swww-daemon не доступен после $max_wait секунд ожидания" >&2
  exit 1
fi

# echo "No supported wallpaper tool found (tried: swww)" >&2
# exit 1
