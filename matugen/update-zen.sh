#!/bin/bash

ZEN_PROFILE="$HOME/.zen/7387bicf.Default (release)"
COLOR_JS="$ZEN_PROFILE/colors.js"
USER_JS="$ZEN_PROFILE/user.js"

grep -v '^user_pref("mod\.sameerasw\.zen_transparency_color"' "$USER_JS" 2>/dev/null > "$USER_JS.tmp" || true
cat "$COLOR_JS" >> "$USER_JS.tmp"
mv "$USER_JS.tmp" "$USER_JS"
