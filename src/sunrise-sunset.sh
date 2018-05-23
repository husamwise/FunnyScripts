#!/bin/bash
# Author: Lubos Rendek web@linuxconfig.org

# First obtain a location code from: https://weather.codes/search/

# Insert your location. For example LOXX0001 is a location code for Bratislava, Slovakia
location="XXXXXXXX"

# Obtain sunrise and sunset raw data from weather.com
sun_times=$( lynx --dump  https://weather.com/weather/today/l/$location | grep "\* Sun" | sed "s/[[:alpha:]]//g;s/*//" )
# Extract sunrise and sunset times and convert to 24 hour format
#sunrise=$(date --date="`echo $sun_times | awk '{ print $1}'` AM" +%R)
#sunset=$(date --date="`echo $sun_times | awk '{ print $2}'` PM" +%R)

sunrise=$(date --date="`echo $sun_times | awk '{ print $1}'` AM" +%H)
sunset=$(date --date="`echo $sun_times | awk '{ print $2}'` PM" +%H)

# Use $sunrise and $sunset variables to fit your needs. Example:
#echo "Sunrise for location $location: $sunrise)"
#echo "Sunset for location $location: $sunset"

TIME=$(date +%H)
DAY=$sunrise
NIGHT=$sunset
if [ ${TIME} -ge ${DAY} -a ${TIME} -le ${NIGHT} ]; then
   echo "100001" > ~/.lightsensor
else
   echo "99999" > ~/.lightsensor
fi