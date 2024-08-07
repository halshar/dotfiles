#!/bin/sh

# Simple script to show the cpu temp formatted to be shown in polybar
temp=$(acpi -t | sed 's/.*, //;s/ degrees //;s/C//')
if [ 1 -eq "$(echo "$temp > 80" | bc)" ]; then
  printf "%%{F#ed0b0b}"
elif [ 1 -eq "$(echo "$temp > 60" | bc)" ]; then
  printf "%%{F#f2e421}"
fi
echo "$temp"°C
