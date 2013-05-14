#!/bin/sh

displayType=$(system_profiler SPDisplaysDataType | grep -w Thunderbolt)

if [[ -n $displayType ]]; then
     serial="$(/usr/sbin/system_profiler | egrep "Display Serial Number:" | awk '{print $4}')"
     echo "<result>$serial</result>"
else
     echo "<result>No Thunderbolt Connected</result>"
fi
