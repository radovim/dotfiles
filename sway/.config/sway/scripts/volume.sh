#!/usr/bin/env bash

if [[ -n "$(command -v wpctl)" ]]; then
    volume=$(wpctl get-volume @DEFAULT_SINK@ 2>/dev/null)
    volume_as_percent=$(awk '{printf("%d", 100 * $2)}' <<< "$volume")
    is_muted=$(awk '{printf($3)}' <<< "$volume" | grep "\[MUTED\]")
else
    volume=$(amixer sget Master | grep -Po "(?<=\[)[0-9]{1,3}(?=%\])")
    let volume_as_percent=$volume
    is_muted=$(amixer sget Master | grep -o "\[off\]")
    echo $is_muted
fi


if [[ "$volume_as_percent" -gt  0 ]]; then
    echo "  $volume_as_percent%"
else
    echo "  "
fi

if [[ -n "$is_muted" ]]; then
    echo "  ($volume_as_percent%)"
fi
