#!/bin/sh

# Outputs the pulse volume level formatted to be shown in polybar
device=$(pactl list sinks | grep 'Name\|Mute\|Volume:' | grep "pci-0000_00" -A 2) 
mute=$(echo "$device" | grep "Mute" | awk '{ print $2 }')
vol=$(echo "$device" | grep "front-left" | awk '{ print $5 }')

if [ "$mute" = "yes" ]; then
    echo "mute"
else
    echo "$vol"
fi
