#!/bin/sh

###########################################
#This script will find if a file has been
#modified past a designated threshold 
#of a specific number of days.  It will 
#return "True" if the modification date of
#the file is older then the number of days 
#specified. It will return "False" if the 
#file has been modified within that date  
#range.  It is formatted to be used as an
#extension attribute for the Casper Suite
#
#Use at your own risk
###########################################

#Read in the last user in case we need it.  Use this variable in your filePath if needed
lastUser=`defaults read /Library/Preferences/com.apple.loginwindow lastUserName`

#####SET SCRIPT VARIABLES HERE######
#path to file we are evaluating
filePath=""
#Example: filePath="/Users/$lastUser/Library/Preferences/com.apple.Finder.plist"

#number of days that we are going to set as a threshold (i.e. older then x days)
#MUST BE AN INT
dayThreshold=""
#Example: dayThreshold="7"

#######GET AND RETURN ROUNDED NUMBER OF DAYS SINCE LAST MODIFIED DATE########
#get last modified of file in epoch
if [ -f $filePath ]; then
	lastMod=`stat -f "%m" $filePath`
else
  echo "<result>FILE DOES NOT EXIST</result>"
  exit 0
fi
#get the current time minus the threshold days in epoch
threshTime=`date -v-"$dayThreshold"d +%s`
#print out to screen just to make sure
echo "threshold=$threshTime, last modified=$lastMod"
#compare the results.  If file is older return true, if newer, return false.
if [ $threshTime -lt $lastMod ]; then
	echo "<result>False</result>"
else
	echo "<result>True</result>"
fi
