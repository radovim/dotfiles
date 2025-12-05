#!/bin/sh

laptop_monitor=$(hyprctl monitors all -j | jq -r '.[] | select(.id==0).name')
laptop_monitor_disabled=$(hyprctl monitors all -j | jq -r '.[] | select(.id==0).disabled')
num_of_enabled_monitors=$(hyprctl monitors all -j | jq '[.[] | select(.disabled==false)] | length')

if [ "$laptop_monitor_disabled" = "false" ]; then
  echo "eDP-1 is ACTIVE"
  # If @laptop_monitor is only active monitor, don't disable it, but reenable it
  if [ $num_of_enabled_monitors -gt 1 ]; then
    echo "DISABLING..."
    hyprmon -profile "only-lg-monitor"
  else
    hyprmon -profile "only-laptop"
    hyprsunset &
  fi
elif [ "$laptop_monitor_disabled" = "true" ]; then
  echo "eDP-1 is NOT ACTIVE"
  if [ "$num_of_enabled_monitors" -gt 0 ]; then
      hyprmon -profile "laptop-plus-lg-monitor"
  else
      hyprmon -profile "laptop-only"
  fi
fi
