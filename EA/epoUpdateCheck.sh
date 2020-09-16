#!/bin/bash

if [ -e /Library/McAfee/agent/bin/cmdagent ];

then
  lastUpdate=$(/Library/McAfee/agent/bin/cmdagent -i | /usr/bin/grep "LastPolicyUpdateTime" | /usr/bin/awk '{ print $2 }')
  formattedDate=$( /bin/date -j -f "%Y%m%d%H%M%S" "$lastUpdate" +"%Y-%m-%d %T" )
  
  if [ -z "$formattedDate" ]; then
      echo "<result>Not updated</result>"
  else
      echo "<result>$formattedDate</result>"
  fi
else
  echo "<result>McAfee agent not installed</result>"
fi
