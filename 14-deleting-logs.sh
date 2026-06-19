#!/bin/bash

LOG_DIR=/home/ec2-user/app_logs
LOG_FILE="$APP_DIR/$0.log"

if [ ! -d $LOG_DIR ]; then
   echo "$LOGS_DIR does not exitst"
   exit 1
fi

FILES_TO_DELETE=$(find $LOG_DIR -name "*.log" -mtime +14)

while IFS= read -r line;
do 
  echo "$line"
done <<< $FILES_TO_DELETE