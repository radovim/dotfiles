!#/bin/sh

if pgrep -x waybar >/dev/null; then
  pkill -x waybar
  uwsm-app -- waybar >/dev/null 2>&1 &
else
  uwsm-app -- waybar >/dev/null 2>&1 &
fi
