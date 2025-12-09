#!/bin/sh

wifi_icon=" "
lan_icon="󰈀 " 

if_wifi="wlan0"
if_lan="enp*"

wifi_status=$(ip --json link show | jq -r --arg if_wifi "$if_wifi" 'map(select(.ifname==$if_wifi)) | .[] | .operstate')
wifi_ip=$(ip --json address show | jq -r --arg if_wifi "$if_wifi" 'map(select(.ifname==$if_wifi)) | .[].addr_info | map(select(.family=="inet")) | .[].local')
ssid=$(iw dev wlan0 info | grep ssid | awk '{print $2}')


lan_status=$(ip --json link show | jq -r --arg if_lan "$if_lan" 'map(select(.ifname | test($if_lan))) | .[] | .operstate')
lan_ip=$(ip --json address show | jq -r --arg if_lan  "$if_lan" 'map(select(.ifname | test($if_lan))) | .[] | .addr_info.[0].local')

if [[ "$wifi_status" == "UP" && "$lan_status" == "UP" ]]; then
    echo "$wifi_icon $ssid  $lan_icon $lan_ip"
elif [[ "$wifi_status" == "UP" && "$lan_status" != "UP" ]]; then
    echo "$wifi_icon $ssid"
elif [[ "$wifi_status" != "UP" && "$lan_status" == "UP" ]]; then
    echo "󰖪   DOWN $lan_icon $lan_ip"
elif [[ "$wifi_status" == "UP" ]]; then
    echo "$wifi_icon $ssid"
else
    echo "󰖪   DOWN"
fi

echo $output
