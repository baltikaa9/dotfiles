#!/bin/bash

# Формируем строку: <span color='background'>address</span> Title
# Wofi отрисует адрес цветом фона (он станет невидимым), а заголовок — обычным текстом.
selected=$(hyprctl clients -j | jq -r '.[] | "<span alpha=\"1%\">\(.address)</span> | \(.class) | \(.title)"' \
    | wofi --dmenu --allow-markup --prompt "Switch to...")

# Извлекаем адрес (он внутри первого тега span)
window=$(echo "$selected" | sed -n 's/.*<span[^>]*>\([^<]*\)<\/span>.*/\1/p')

if [ ! -z "$window" ]; then
    # Фокусируем окно
    hyprctl dispatch focuswindow address:$window
    # Тот самый "прыжок" курсора, чтобы не искать его на двух мониторах
    hyprctl dispatch warpcursor address:$window
fi
