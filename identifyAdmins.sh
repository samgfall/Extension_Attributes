#!/bin/sh
#Enter in a list of users you would not like returned as notExempt Users, seperated by a |
exempt="admin|ladmin"

adminList="$(/usr/bin/dscl . read /Groups/admin | grep "GroupMembership:" | awk '{$1=""; print $0}')"
notExempt=""
for word in $adminList; do 
  found="$(/bin/echo $word | egrep -e "$exempt" | wc -l | awk '{print $NF}')"
	if [[ "$found" != "1" ]]; then
		notExempt=$notExempt" $word"
	fi
done

#Output List of non-exempt Users
#echo "<result>$notExempt </result>"

#Output # of non-exempt Users
notExemptCount="$(echo $notExempt | wc -w | awk '{print $NF}')"
echo "<result>$notExemptCount</result>"
