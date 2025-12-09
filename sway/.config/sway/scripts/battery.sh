#!/bin/sh

battery_name="/org/freedesktop/UPower/devices/battery_BAT1"
percentage=$(upower -i $battery_name | grep percentage | awk '{print $2}')
state=$(upower -i $battery_name  | grep state | awk '{print $2}')

if [[ "$state" == "charging" ]]; then
    icon=" "
else
    icon="󱊢"
fi

echo "$icon $percentage"
