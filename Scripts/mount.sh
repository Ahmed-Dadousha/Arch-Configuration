#!/bin/bash
# Get USB Devices
parts=$(ls /sys/dev/block/ -lah | grep usb | awk -F'/' '{print $(NF)}' | grep -o '\bsd[a-z][0-9]\b')

# If no devices 
if [ -z "$parts" ];then
	echo "No USB Devices Found" | dmenu -fn "MesloLGS NF:size=12"  -nf "#bbbbbb" -sf "#bbbbbb" -l 5 -p "USEB Devices: "
	exit
fi
# Choose A USB Device
choice=$(lsblk -o name,size,mountpoint /dev/$parts |grep sd |dmenu -fn "MesloLGS NF:size=12" -nf "#bbbbbb" -sf "#bbbbbb" -l 5 -p "USB Devices: ")

# If Dvice Already Mounted Unmount It
devname=$(echo  $choice  |awk '{print $1}')
devmount=$(echo $choice |awk '{print $3}')
devreal=$(echo  $parts |grep $devname)

if [ ! -z $devname ];then

if [ "$devreal" == "$devname" ];then


if [  -z $devmount ];then
	
	doas rmdir /mnt/$devname 2> /dev/null 
	doas mkdir /mnt/$devname
	doas mount /dev/$devname /mnt/$devname

else	
	doas umount /mnt/$devname
	doas rmdir  /mnt/$devname 
fi

fi

fi
