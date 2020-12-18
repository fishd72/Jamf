#!/bin/sh

# EA to determine if the device currently has a firmware password set
# Returns a simple Yes / No for Intel devices or Not supported for M1 based devices
# Simple Error status for issues with the command or to handle virtual devices

archCheck=$(/usr/bin/arch)

if [ "$archCheck" == "arm64" ]; then
    passwordCheck="Not supported"
else
    passwordCheck=$(/usr/sbin/firmwarepasswd -check | awk '{print $3}')
    if [ ${#passwordCheck} -gt 3 ]; then
        passwordCheck="Error"
    fi
fi

echo "<result>$passwordCheck</result>"

exit 0
