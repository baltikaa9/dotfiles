#!/bin/sh

file="$HOME/.local/state/tomat/pomodoros"
today=$(date +%F)

mkdir -p "$(dirname "$file")"

if [ -f "$file" ]; then
    last_date=$(tail -n 1 "$file" | awk '{print $1}')
    last_count=$(tail -n 1 "$file" | awk '{print $2}')
else
    last_date=""
    last_count=0
fi

if [ "$last_date" = "$today" ]; then
    count=$((last_count + 1))

    # Заменяем только последнюю строку текущего дня
    sed -i '$d' "$file"
    printf '%s %d\n' "$today" "$count" >> "$file"
else
    # Новый день — добавляем новую строку, старые не трогаем
    printf '%s 1\n' "$today" >> "$file"
fi
