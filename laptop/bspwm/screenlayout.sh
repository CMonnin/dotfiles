#!/bin/sh
# Configure xrandr layout and bspwm desktop assignment.
# Safe to re-run; called on startup and on monitor hotplug.
# Refs:
#   https://github.com/baskerville/bspwm/wiki
#   https://wiki.archlinux.org/title/Bspwm#Multiple_monitors

INTERNAL=eDP-1

connected() {
    xrandr --query | awk '/ connected/ {print $1}'
}

EXTERNAL=$(connected | grep -vx "$INTERNAL" | head -n1)

if [ -n "$EXTERNAL" ]; then
    xrandr --output "$INTERNAL" --auto --primary \
           --output "$EXTERNAL" --auto --right-of "$INTERNAL"
else
    xrandr --output "$INTERNAL" --auto --primary
    # Turn off any outputs bspwm still thinks are active
    for o in $(bspc query -M --names 2>/dev/null); do
        [ "$o" = "$INTERNAL" ] || xrandr --output "$o" --off 2>/dev/null
    done
fi

# Give bspwm a moment to pick up the RandR change
sleep 0.3

# Remove bspwm monitors that no longer have a connected output
for m in $(bspc query -M --names 2>/dev/null); do
    connected | grep -qx "$m" || bspc monitor "$m" -r 2>/dev/null
done

if [ -n "$EXTERNAL" ] && bspc query -M --names | grep -qx "$EXTERNAL"; then
    bspc monitor "$EXTERNAL" -d 6 7 8 9 10
    bspc monitor "$INTERNAL" -d 1 2 3 4 5
else
    bspc monitor "$INTERNAL" -d 1 2 3 4 5 6 7 8 9 10
fi

bspc wm --adopt-orphans 2>/dev/null

"$HOME/.config/polybar/launch.sh" &
