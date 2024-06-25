#!/bin/bash
siteList=("www.google.com" "www.facebook.com" "https://www.x.com" "https://test.com")
logsFile='pinger.log'
isUp='UP'
isDown='DOWN'

for url in ${siteList[@]}; do
  res=`curl -m 2 -L -s -w  "%{http_code}\n" $url -o /dev/null`
  current_date=$(date +"%FT%T")

  if [[ $res -eq 200 ]]
  then
    echo $current_date '|' $url ' is ' $isUp >> $logsFile
  else
    echo $current_date '|' $url ' is ' $isDown >> $logsFile
  fi
done

echo 'Ping completed. Results can be found in' $logsFile