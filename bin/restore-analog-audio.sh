#!/bin/sh

analog=alsa_output.pci-0000_0c_00.3.analog-stereo
digital=alsa_output.pci-0000_0c_00.3.iec958-stereo
state_file=${XDG_STATE_HOME:-$HOME/.local/state}/wireplumber/default-nodes

# Respect the saved choice if the user selected another output.
grep -Fqx "default.configured.audio.sink=$analog" "$state_file" || exit 0
[ "$(pactl get-default-sink 2>/dev/null)" = "$digital" ] || exit 0

# The greeter's user manager can keep running briefly after login.
for attempt in $(seq 1 30); do
    users=$(loginctl list-users --no-legend --no-pager) || exit 1
    if ! printf '%s\n' "$users" | awk '$2 == "sddm" { found = 1 } END { exit !found }'; then
        break
    fi
    [ "$attempt" -lt 30 ] || exit 0
    sleep 1
done

# Retry enumeration only if the analog output is still missing.
[ "$(pactl get-default-sink 2>/dev/null)" = "$digital" ] || exit 0
sinks=$(pactl list short sinks) || exit 1
if printf '%s\n' "$sinks" | awk -v sink="$analog" '$2 == sink { found = 1 } END { exit !found }'; then
    exit 0
fi

logger -t restore-analog-audio 'Saved analog output missing after login; restarting WirePlumber once'
exec systemctl --user restart wireplumber.service
