#!/bin/bash
set -e
D=~/.config/wlogout
S=/usr/share/wlogout/icons

get() { grep -oP "@define-color\s+$1\s+\K(#[0-9a-fA-F]{6,8}|rgba?\([^)]*\))" "$D/colors.css" | head -n1; }

to_hex() {
  case "$1" in
    \#*) echo "${1:0:7}" ;;
    rgb*)
      IFS=' ' read -r r g b <<< "$(echo "$1" | grep -oP '[0-9.]+' | head -n3 | tr '\n' ' ')"
      printf '#%02x%02x%02x' "${r%.*}" "${g%.*}" "${b%.*}" ;;
  esac
}

FG=$(to_hex "$(get fg)")
HV=$(to_hex "$(get on_accent)")
[ -z "$FG" ] || [ -z "$HV" ] && { echo "fg/on_accent не найдены в $D/colors.css" >&2; exit 1; }

STAMP="$D/icons/.colors"
if [ -f "$STAMP" ] && [ "$(cat "$STAMP")" = "$FG $HV" ] \
   && [ -f "$D/icons/n/reboot.png" ] && [ -f "$D/icons/h/reboot.png" ]; then
  exit 0
fi

mkdir -p "$D/icons/n" "$D/icons/h"
declare -A SRC=(
  [lock]=lock [logout]=logout_l [suspend]=pause_l
  [hibernate]=hibernate [shutdown]=shutdown_l [reboot]=reboot_l
)
for n in "${!SRC[@]}"; do
  magick "$S/${SRC[$n]}.png" -fill "$FG" -colorize 100 "$D/icons/n/$n.png"
  magick "$S/${SRC[$n]}.png" -fill "$HV" -colorize 100 "$D/icons/h/$n.png"
done

echo "$FG $HV" > "$STAMP"
