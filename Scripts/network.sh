#!/bin/bash

else
#!/bin/bash
    ping -c 1 -w 1 8.8.8.8 > /dev/null 2>&1
   return $?
}

# Function to determine active network interface
get_network_interface() {
   NI=$(route -n | awk '$1 == "0.0.0.0" {print $NF}')
   SSID=$(nmcli -t -f NAME connection show --active | grep -v '^lo$')


if [[ "$NI" == w* ]];then
        check_internet
        if [ $? -eq 0 ];then
        echo "$SSID UP"
        else
        echo "$SSID DOWN"
        fi

elif [[ "$NI" == e*  ]];then
        check_internet
        if [ $? -eq 0 ];then
        echo "Cable UP"
        else
        echo "Cable DOWN"
        fi
else
        echo ""
fi
}
get_network_interface
