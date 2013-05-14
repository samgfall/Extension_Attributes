#!/bin/sh
mac="$(/bin/cat /var/log/system.log | grep "AppleUSBEthernet: Ethernet" | tail -n 1| awk '{print $NF}' | tr ':' '.' )"
echo "<result>$mac</result>"
