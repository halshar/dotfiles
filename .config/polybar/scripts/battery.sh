#!/bin/bash

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [ "$STATUS" = "Discharging" ]; then
    STATUS="  "

    if [ "$CAPACITY" -le "5" ]; then
        notify-send --icon="battery-caution-symbolic.svg" "Battery" "Battery is critically low!"
    elif [ "$CAPACITY" -le "15" ]; then
        notify-send --icon="battery-low-symbolic.svg" "Battery" "Low battery, connect charger!"
    fi

else
    STATUS="  "
fi

echo "$STATUS${CAPACITY}%"

