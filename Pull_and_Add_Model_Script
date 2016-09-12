#! /bin/bash
/usr/bin/git -C /Library/iStores pull
while read Model
do 
  cachewarmer --add-model $Model
done </Library/iStores/CacheWarmerModels
