#! /bin/bash

CURRENT_LAYOUT=$(xkb-switch -p)

if [ "$CURRENT_LAYOUT" = "us" ]; then
    xkb-switch -s ru
#	notify-send "Lang: RU" -t 700
else
    xkb-switch -s us
#    notify-send "Lang: US" -t 700
fi
