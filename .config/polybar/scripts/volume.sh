#!/bin/sh

# Outputs the pulse volume level formatted to be shown in polybar
device=$(pactl list sinks | grep 'Name\|Mute\|Volume:' | grep "pci-0000_00" -A 2) 
mute=$(echo "$device" | grep "Mute" | awk '{ print $2 }')
vol=$(echo "$device" | grep "front-left" | awk '{ print $5 }')

if [ "$mute" = "yes" ]; then
    echo "mute"
elif [ "$(echo "$vol" | tr -d "%")" -gt 70 ]; then
    echo "$vol"
elif [ "$(echo "$vol" | tr -d "%")" -gt 35 ]; then
    echo "$vol"
else
    echo "$vol"
fi
