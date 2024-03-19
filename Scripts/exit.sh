#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nExit" | dmenu  -fn "MesloLGS NF:size=12"  -nf "#bbbbbb" -sf "#bbbbbb" -l 3 -p "choose action: " )

[ $choice = "Shutdown" ] && doas poweroff
[ $choice = "Reboot" ] && doas reboot
[ $choice = "Exit" ] && pkill dwm
