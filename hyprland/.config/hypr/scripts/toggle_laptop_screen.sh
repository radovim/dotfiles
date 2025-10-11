#!/bin/sh

laptop_monitor="eDP-1"
resolution="prefferd"
position_main="0x0"
position_down="698x1728"
scale="1.25"

monitors=$(hyprctl monitors | /usr/bin/grep -oP "(?<=Monitor\s)([^\s]+)(?=\s\()")
readarray -t monitors <<< "$monitors"

echo "All monitors: ${monitors[@]}"
echo "Number of monitors: ${#monitors[@]}"

laptop_monitor_state="disabled"
for monitor in ${monitors[@]}; do
    if [ "$monitor" = "$laptop_monitor" ]; then
        echo "Found: $monitor=$laptop_monitor"
        laptop_monitor_state="enabled"
        break
    fi
done

if [ "$laptop_monitor_state" = "enabled" ]; then
    echo "eDP-1 is ACTIVE"
    # If @laptop_monitor is only active monitor, don't disable it
    if [ ${#monitors[@]} -gt 1 ]; then
        echo "DISABLING..."
        hyprctl keyword monitor $laptop_monitor,disable
    fi
elif [ "$laptop_monitor_state" = "disabled" ]; then
    echo "eDP-1 is NOT ACTIVE"
    if [ ${#monitors[@]} -gt 0 ]; then
        echo "Setting DOWN position"
        position=$position_down
    else
        echo "Setting MAIN position"
        position=$position_main
    fi
    echo "ENABLING..."
    hyprctl keyword monitor $laptop_monitor,$resolution,$position,$scale
fi

