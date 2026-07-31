#!/bin/bash

for dev in ddcci0 ddcci1; do
    brightnessctl -d "$dev" "$@"
done
