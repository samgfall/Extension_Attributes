#!/bin/sh
mac="$(/bin/cat /var/log/system.log | grep "AppleUSBEthernet: Ethernet" | tail -n 1 | awk '{print $NF}' | tr ':' '.' )"

if [[ "$mac" == "" ]]; then
mac="$(/bin/cat /var/log/system.log | grep "BCM5701Enet: Ethernet" | tail -n 1 | awk '{print $NF}' | tr ':' '.' )"
fi


if [[ "$mac" != "" ]]; then
     echo "<result>$mac</result>"
else
     echo "not found"
fi
