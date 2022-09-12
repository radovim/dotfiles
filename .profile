#!/bin/bash

if [ $DESKTOP_SESSION = "qtile" ]
then
    /home/$USER/.startup &
fi
