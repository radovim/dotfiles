#!/bin/sh

RESOLUTION="prefferd"
POSITION_MAIN="0x0"
POSITION_DOWN="528x1728"
SCALE="1.5"

laptop_monitor=$(hyprctl monitors all -j | jq -r '.[] | select(.id==0).name')
laptop_monitor_disabled=$(hyprctl monitors all -j | jq -r '.[] | select(.id==0).disabled')
num_of_enabled_monitors=$(hyprctl monitors all -j | jq '[.[] | select(.disabled==false)] | length')

if [ "$laptop_monitor_disabled" = "false" ]; then
    echo "eDP-1 is ACTIVE"
    # If @laptop_monitor is only active monitor, don't disable it
    if [ $num_of_enabled_monitors -gt 1 ]; then
        echo "DISABLING..."
        hyprctl keyword monitor $laptop_monitor,disable
    fi
elif [ "$laptop_monitor_disabled" = "true" ]; then
    echo "eDP-1 is NOT ACTIVE"
    if [ "$num_of_enabled_monitors" -gt 0 ]; then
        echo "Setting DOWN position"
        position=$POSITION_DOWN
    else
        echo "Setting MAIN position"
        position=$POSITION_MAIN
    fi
    echo "ENABLING..."
    hyprctl keyword monitor $laptop_monitor,$RESOLUTION,$position,$SCALE
fi

