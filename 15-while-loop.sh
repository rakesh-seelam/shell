#!/bin/bash

COUNT=1

while [ $COUNT -lt 6 ];
do 
  echo "count is : $COUNT"
  sleep 1
  ((COUNT++))
done