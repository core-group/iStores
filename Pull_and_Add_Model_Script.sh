#! /bin/bash
/usr/bin/git -C /Library/iStores pull
while read Model
do 
  /usr/local/bin/CacheWarmer --add-model $Model
done </Library/iStores/CacheWarmerModels
/usr/local/bin/CacheWarmer --disable mac
/usr/local/bin/CacheWarmer --enable ios-filter
/usr/local/bin/CacheWarmer --verbose
