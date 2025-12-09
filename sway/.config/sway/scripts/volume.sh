#!/bin/sh

volume=$(wpctl get-volume @DEFAULT_SINK@)
volume_as_percent=$(awk '{printf("%d", 100 * $2)}' <<< "$volume")

if [[ "$volume_as_percent" -gt  0 ]]; then
    echo "  $volume_as_percent%"
else
    echo "  "
fi
