#!/bin/bash

in_note=0
title=""
note=""

# Шаблон разметки для calcurse
fmt="START_APT
DATE_TITLE:%(start:%d.%m.%Y %H:%M) — %m
NOTE:%N
END_APT
"

# Запрашиваем список будущих событий, начиная с текущего момента (now)
while IFS= read -r line; do
    if [[ "$line" =~ ^DATE_TITLE:(.*) ]]; then
        title="${BASH_REMATCH[1]}"
    elif [[ "$line" =~ ^NOTE:(.*) ]]; then
        note="${BASH_REMATCH[1]}"
        in_note=1
    elif [[ "$line" == "END_APT" ]]; then
        # Отправляем уведомление для самого ближайшего события и выходим
        notify-send -a "Календарь" "$title" "$note"
        break
    elif [[ $in_note -eq 1 ]]; then
        note="$note"$'\n'"$line"
    fi
done < <(calcurse -Q --from now --days 1 --format-apt "$fmt" --format-recur-apt "$fmt")
