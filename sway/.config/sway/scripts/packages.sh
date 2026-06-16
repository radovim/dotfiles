#!/bin/bash

distro=$(grep ^ID= /etc/os-release | cut -d= -f2 | tr -d '"')

if [[ "$distro" == 'void' ]]; then
    num_packages=$(xbps-install -un | wc -l)
fi

if [[ $num_packages -eq 0 ]]; then
    output=" 󰏗 "
else
    # Use \t to insert a tab since swaybar trims blank spaces
   output="󱧘 \t$num_packages" 
fi

echo $output
