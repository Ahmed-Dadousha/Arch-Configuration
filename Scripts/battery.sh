#!/bin/bash

# Get battery percentage
battery_percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage" | awk '{print $2}')

# Check if the battery is charging or discharging
charging_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state" | awk '{print $2}')

echo "$battery_percentage $charging_status"
