#!/usr/bin/env bash
PIDFILE="$HOME/.cache/wfrec.pid"
VIDEODIR="$HOME/Videos"

# если pid‑файл есть и процесс жив — завершаем запись
if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  kill -SIGINT "$(cat "$PIDFILE")"
  rm -f "$PIDFILE"
  exit
fi

# иначе — стартуем новую запись
mkdir -p "$VIDEDIR"
wf-recorder -g "$(slurp)" -f "$VIDEODIR/$(date +'%Y_%m_%d_%H_%M_%S').mp4" &
echo $! > "$PIDFILE"

