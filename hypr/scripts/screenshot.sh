#!/usr/bin/env bash
# grimblast по клику на окно снимает его через `grim -T` (захват одного окна):
# за окном ничего не отрисовано, и стекло hyprglass вместо обоев даёт серую заливку.
# Отдаём slurp прямоугольники окон без stableId — grimblast снимает их через `grim -g`,
# как до обновления grimblast-git r173.
ws=$(hyprctl monitors -j | jq '[.[] | if .specialWorkspace.name == "" then .activeWorkspace.id else .specialWorkspace.id end]')
export SLURP_RECTS="$(hyprctl clients -j | jq -r --argjson ws "$ws" \
    '.[] | select(.mapped and (.workspace.id as $w | $ws | index($w))) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')"
export GRIMBLAST_EDITOR="satty --filename" SLURP_ARGS="-w 0"
exec grimblast "$@" edit area
