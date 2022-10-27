#!/bin/sh

LoggedInUser=$( /usr/sbin/scutil <<< "show State:/Users/ConsoleUser" | /usr/bin/awk -F': ' '/[[:space:]]+Name[[:space:]]:/ { if ( $2 != "loginwindow" ) { print $2 }}' )
LoggedInUserHome="/Users/$LoggedInUser"

# echo "Logged in user is $LoggedInUser"
# echo "Logged in user's home $LoggedInUserHome"

if [ -e /usr/local/bin/dockutil ];
then
    dockutilVersion=`/usr/local/bin/dockutil --version --version`; echo "dockutil version: $dockutilVersion"

    echo "Adding Company Portal..."; /usr/local/bin/dockutil --add '/Applications/Self Service.app' --no-restart --replacing "Siri" "$LoggedInUserHome"
    echo "Removing Mail.app..."; /usr/local/bin/dockutil --remove 'Mail' --no-restart "$LoggedInUserHome"
    echo "Removing Calendar..."; /usr/local/bin/dockutil --remove 'Calendar' --no-restart "$LoggedInUserHome"
    echo "Removing Notes..."; /usr/local/bin/dockutil --remove 'Notes' --no-restart "$LoggedInUserHome"
    echo "Removing Contacts..."; /usr/local/bin/dockutil --remove 'Contacts' --no-restart "$LoggedInUserHome"
    echo "Removing Reminders..."; /usr/local/bin/dockutil --remove 'Reminders' --no-restart "$LoggedInUserHome"
    echo "Removing Messages..."; /usr/local/bin/dockutil --remove 'Messages' --no-restart "$LoggedInUserHome"
    echo "Removing FaceTime..."; /usr/local/bin/dockutil --remove 'FaceTime' --no-restart "$LoggedInUserHome"
    echo "Removing TV..."; /usr/local/bin/dockutil --remove 'TV' --no-restart "$LoggedInUserHome"
    echo "Removing Music..."; /usr/local/bin/dockutil --remove 'Music' --no-restart "$LoggedInUserHome"
    echo "Removing Podcasts..."; /usr/local/bin/dockutil --remove 'Podcasts' --no-restart "$LoggedInUserHome"
    echo "Removing App Store..."; /usr/local/bin/dockutil --remove 'App Store' "$LoggedInUserHome"
# else
#     echo "dockutil not installed, skipping initial dock setup..."
fi

exit 0