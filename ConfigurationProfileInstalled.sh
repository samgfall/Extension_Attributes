#!/bin/sh

#####################################################################################
# Place the exact display name of Configuration Profile below                       #
#####################################################################################
name="Wifi profile"
#####################################################################################


# Dump profiles to file
/usr/bin/profiles -L -o /tmp/profiles.plist

# Count the occurrences of your name
count="$(/bin/cat /tmp/profiles.plist | grep "$name" | wc -l | awk '{print $1}')"

# Delete the dump file
/bin/rm -f /tmp/profiles.plist

# Report finding back to the JSS
if [[ $count -gt 0 ]];then
echo "<result>Installed</result>"
else
echo "<result>Not Installed</result>"
fi
