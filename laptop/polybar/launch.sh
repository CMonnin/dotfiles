#!/bin/sh
# Launch one top+bottom polybar per connected monitor.
# Ref: https://github.com/polybar/polybar/wiki/Configuration#running-polybar-on-multiple-monitors

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 0.1; done

if type xrandr >/dev/null 2>&1; then
    for m in $(polybar --list-monitors | cut -d: -f1); do
        MONITOR=$m polybar --reload top &
        MONITOR=$m polybar --reload bottom &
    done
else
    polybar --reload top &
    polybar --reload bottom &
fi
