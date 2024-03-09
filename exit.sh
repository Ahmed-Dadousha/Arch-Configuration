#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nExit" | dmenu -i -p "choose action: " )

[ $choice = "Shutdown" ] && doas poweroff
[ $choice = "Reboot" ] && doas reboot
[ $choice = "Exit" ] && pkill dwm
