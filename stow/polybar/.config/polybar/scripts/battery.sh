#!/bin/bash

read -r CAPACITY </sys/class/power_supply/BAT0/capacity
read -r STATUS </sys/class/power_supply/BAT0/status

if [ "$STATUS" = "Discharging" ]; then
  STATUS=" %{F#FF6289} %{F-}"

  if [ "$CAPACITY" -le "5" ]; then
    notify-send -u critical "Battery" "Battery is critically low!"
  elif [ "$CAPACITY" -le "15" ]; then
    notify-send "Battery" "Low battery, connect charger!"
  fi

else
  STATUS=" %{F#FF93AC} %{F-}"
fi

echo "${STATUS}${CAPACITY}"
