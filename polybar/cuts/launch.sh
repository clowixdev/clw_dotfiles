#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/cuts"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
external_monitor=$(xrandr -q | grep "HDMI-1" | cut -d ' ' -f2) 
if [[ $external_monitor == "connected" ]]; then
	polybar -q top -c "$DIR"/config.ini &
	polybar -q bottom -c "$DIR"/config.ini &
	polybar -q top-second -c "$DIR"/config.ini &
	polybar -q bottom-second -c "$DIR"/config.ini
else
	polybar -q top -c "$DIR"/config.ini &
	polybar -q bottom -c "$DIR"/config.ini &
fi
