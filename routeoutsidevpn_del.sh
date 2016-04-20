#!/bin/sh

while read subnet; do
  #Exclude comments from subnet list
  if [ `echo $subnet | grep -v '#'` ];then

  echo Removing route for $subnet
  route delete $subnet


  fi
done < List_of_Subnets.txt
