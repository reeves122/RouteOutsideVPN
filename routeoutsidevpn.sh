#!/bin/bash

#A basic check for Cygwin
if [ -f /cygwin.bat ];then
  echo ''
  echo '** cygwin detected **'
  echo '** Make sure you run this script as an admistrator **'
  echo ''
  #Attempt to get local gateway
  LOCALGW=`route print | grep -i "0.0.0.0" | awk '{print $3}' | grep -v "On-link"`
fi

#A Basic check for Mac OS X
if [ -f /mach_kernel ];then
  echo ''
  echo '** Mac OS X detected **'
  echo '** Make sure you run this script as root **'
  echo ''
  #Attempt to get local gateway
  LOCALGW=`netstat -rn | grep UHLWIi | awk '{print $1}' | head -n 1`
fi

if [ -z $LOCALGW ];then
  echo 'ERROR: Unable to get local gateway'
  exit
fi

echo ''
echo Local Gateway is $LOCALGW
echo ''

while read subnet; do
  #Exclude comments from subnet list
  if [ `echo $subnet | grep -v '#'` ];then
    
  echo Adding route for $subnet
  route add $subnet $LOCALGW  


  fi
done < List_of_Subnets.txt



