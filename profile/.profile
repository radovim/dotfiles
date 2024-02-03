#!/bin/bash

if [ $DESKTOP_SESSION = "qtile" ]; then
    /home/$USER/.startup &
elif [ $DESKTOP_SESSION = "gnome" ]; then
    if [ $XDG_SESSION_TYPE = "wayland" ]; then
        export WINIT_UNIX_BACKEND=x11
    else
        xbindkeys &
    fi
    touch /home/ary/4
fi
