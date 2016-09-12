#! /bin/sh
# install XCode Command Line Tools
/usr/bin/touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;
# Clone the iStores Repo into Library
/usr/bin/sudo /usr/local/bin/git clone https://github.com/core-group/iStores.git /Library/iStores
/usr/bin/sudo /bin/cp /Library/iStores/com.core.istore.RunGitPull.plist /Library/LaunchDaemons/
/usr/bin/sudo /bin/launchctl load -w /Library/LaunchDaemons/com.core.istore.RunGitPull.plist
