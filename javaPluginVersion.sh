#!/bin/sh

# Check to see if Java 1.6 is installed
if [[ -e /Library/Java/Home ]]; then
echo "<result>$(java -version 2>&1 | awk '/version/{print $3}' | sed 's/"//g')</result>"

# Check to see if Java 1.7 is installed
elif [[ -e /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin ]]; then
echo "<result>$(cat /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Info.plist | grep 'jpi-version' | tr '=','<' ' ' | awk '{print $2}')</result>"

# Report back if Java is not found
else
echo "<result>Not Installed</result>"
fi
