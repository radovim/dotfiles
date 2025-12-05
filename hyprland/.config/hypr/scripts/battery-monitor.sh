#!/bin/bash

# Designed to be run by systemd timer every 30 seconds and alerts if battery is low

declare -a BATTERY_THRESHOLDS=(20 10 5)
NOTIFICATION_FLAG="/run/user/$UID/battery_notified"

get_battery_percentage() {
  upower -i "$(upower -e | grep 'BAT')" |
    awk -F: '/percentage/ {
      gsub(/[%[:space:]]/, "", $2);
      val=$2;
      printf("%d\n", (val+0.5))
      exit
    }'
}

get_battery_state() {
  upower -i $(upower -e | grep 'BAT') | grep -E "state" | awk '{print $2}'
}

send_notification() {
  notify-send -u ${2} "󱐋 Time to recharge!" "Battery is down to ${1}%" -i battery-caution -t 30000
}

BATTERY_LEVEL=$(get_battery_percentage)
BATTERY_STATE=$(get_battery_state)

THRESHOLDS_NUM=${#BATTERY_THRESHOLDS[@]}
let LAST_INDEX=$THRESHOLDS_NUM-1

for ((i = 0; i < THRESHOLDS_NUM; i++)); do
  if [ "$BATTERY_STATE"="discharging" ]; then
    if [ "$i" -lt "$LAST_INDEX" ]; then
      let NEXT_IDX=$i+1
      if [ "$BATTERY_LEVEL" -le "${BATTERY_THRESHOLDS[$i]}" ] && [ "$BATTERY_LEVEL" -gt "${BATTERY_THRESHOLDS[$NEXT_IDX]}" ]; then
        if [ ! -f "${NOTIFICATION_FLAG}_$i" ]; then
          send_notification "$BATTERY_LEVEL" "normal"
          touch "${NOTIFICATION_FLAG}_$i"
        fi
      fi
    else
      if [ "$BATTERY_LEVEL" -le "${BATTERY_THRESHOLDS[$i]}" ]; then
        if [ ! -f "${NOTIFICATION_FLAG}_$i" ]; then
          send_notification "$BATTERY_LEVEL" "critical"
          touch "${NOTIFICATION_FLAG}_$i"
        fi
      fi
    fi
  else
    rm -f "${NOTIFICATION_FLAG}_$i"
  fi
done
