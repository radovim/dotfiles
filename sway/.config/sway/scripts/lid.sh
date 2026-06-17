#!/usr/bin/env bash
# Handle lid close: lock + disable eDP-1 only when no external monitor is attached.

set -euo pipefail

INTERNAL="eDP-1"

# Count outputs that are active and not the internal panel.
external_count=$(swaymsg -t get_outputs \
    | jq "[.[] | select(.name != \"$INTERNAL\" and .active == true)] | length")

case "${1:-}" in
    close)
        swaymsg "output $INTERNAL disable"
        if [ "$external_count" -eq 0 ]; then
            pgrep -x swaylock >/dev/null || swaylock -f -c 000000
        fi
        ;;
    open)
        swaymsg "output $INTERNAL enable"
        ;;
esac
