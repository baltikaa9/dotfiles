#!/usr/bin/bash

dayImg="$HOME/Pictures/wallpapers/Forest-Light.png"
nightImg="$HOME/Pictures/wallpapers/Forest-Dark.png"

hours=$(date +%k)

if (( hours >= 6 && hours < 18 )); then
  img="$dayImg"
else 
  img="$nightImg"
fi

# sleep 1

if command -v swww >/dev/null 2>&1; then
  # Пример вызова swww (отредактируй опции если нужно)
  swww img $img -o DP-2
  exit $?
fi

echo "No supported wallpaper tool found (tried: swww)" >&2
exit 1
