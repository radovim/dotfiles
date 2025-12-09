#! /bin/bash

layout_array=($(swaymsg -t get_inputs -r | jq -r 'map(select(.xkb_layout_names != null) | .xkb_layout_names) | unique | .[0] | .[]' | sed 's/ /-/' ))
layout_index=($(swaymsg -t get_inputs -r | jq -r 'map(select(.xkb_active_layout_index != null) | .xkb_active_layout_index) | unique | .[0]' ))
current_layout="${layout_array[$layout_index]}"

case $current_layout in
    "English-(US)")
        echo "  us"
        ;;
    "Serbian")
        echo "  срб"
        ;;
    "Serbian-(Latin)")
        echo "  srb"
        ;;
esac

