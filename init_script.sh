#! /bin/sh
# install XCode Command Line Tools
/usr/bin/touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;
#Download, Install and License Cache Warmer
curl -o /Users/Shared/CacheWarmer-17.pkg https://s3.amazonaws.com/assetcache.io/CacheWarmer-17.pkg 
installer -pkg /Users/Shared/CacheWarmer-17.pkg -target /
# Clone the iStores Repo into Library
git clone https://github.com/core-group/iStores.git /Library/iStores
cp /Library/iStores/com.core.istore.RunGitPull.plist /Library/LaunchDaemons/
launchctl load -w /Library/LaunchDaemons/com.core.istore.RunGitPull.plist
