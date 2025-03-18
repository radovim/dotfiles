#!/bin/sh

internal_screen_name="eDP-1"
resolution="prefferd"
position="698x1728"
scale="1.25"

screen_state=$(hyprctl monitors | grep $internal_screen_name)

if [ -n "$screen_state" ]
then
    hyprctl keyword monitor eDP-1,disable
else
    hyprctl keyword monitor eDP-1,$resolution,$position,$scale
fi

