#! /bin/sh

kb_layout=$(~/.config/sway/scripts/print_current_layout.sh)
date=$(date +'%d-%b-%Y')
time=$(date +'%H:%M:%S')
battery_status=$(~/.config/sway/scripts/battery.sh)
network_status=$(~/.config/sway/scripts/network_status.sh)
volume=$(~/.config/sway/scripts/volume.sh)
packages=$(~/.config/sway/scripts/packages.sh)
_sep_="|"
echo "$volume $_sep_ $network_status $_sep_ $packages $_sep_ $kb_layout $_sep_ $battery_status $_sep_   $date    $time $_sep_"
sleep 1



