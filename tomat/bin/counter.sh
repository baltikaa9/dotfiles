#!/bin/sh

file="$HOME/.local/state/tomat/pomodoros"

mkdir -p "$(dirname "$file")"

today=$(date +%F)

if [ -f "$file" ]; then
    read date count < "$file"
else
    date=""
    count=0
fi

if [ "$date" = "$today" ]; then
    count=$((count + 1))
else
    count=1
fi

printf '%s %s\n' "$today" "$count" > "$file"
