#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nExit" | dmenu -l 3 -p "choose action: " )

[ $choice = "Shutdown" ] && doas poweroff
[ $choice = "Reboot" ] && doas reboot
[ $choice = "Exit" ] && pkill dwm
