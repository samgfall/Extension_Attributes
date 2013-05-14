#!/bin/sh

jver=$(/bin/cat /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Info.plist | grep 'jpi-version' | tr '</key>','=' ' '| awk '{print $NF}')

echo "<result>$jver</result>"
