#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #default days 14

if [ $USERID -ne 0 ]; then
   echo -e "$R Run this script as root user $N"
   exit 1
fi

mkdir -p $LOGS_FOLDER

log(){
   echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
}
 
USAGE(){
    echo -e "$R Usage: <SOURCE_DIR> <DEST_DIR> <DAYS>[Default 14] $N"
    exit 1
}

if [ $# -lt 2 ]; then
   USAGE
fi

if [ ! -d "$SOURCE_DIR" ]; then
   echo -e "$R Source directory: $SOURCE_DIR does not exist $N"
   exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
   echo -e "$R Destination directory: $DEST_DIR does not exist $N"
   exit 1
fi

#Checks if files are there in $SOURCE_DIR
FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +$DAYS)

log "Backup started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "$DAYS"

if [ -z "${FILES}" ]; then
   echo -e "No files to backup $Y SKIPPING $N "
else
   echo -e "$G Files found for Archive $N"
   TIME_STAMP=$(date +%F-%H-%M-%S)
   ZIP_FILE_NAME="$DEST_DIR/app_logs-$TIME_STAMP.tar.gz"
   log "Archive name: $ZIP_FILE_NAME"
   tar -zcvf $ZIP_FILE_NAME $(find "$SOURCE_DIR" -name "*.log" -type f -mtime +$DAYS)

   if [ -f $ZIP_FILE_NAME ]; then
    log -e "Archival $G success $N"

    while IFS= read -r filepath;
    do
      log "Deleting file: $filepath"
      rm -f $filepath
      log "Deleted file: $filepath"
    done <<< $FILES
   else
    log -e "Archival $R Failure $N"
   fi
fi

# # Check archieve is success or not
#     if [ -f $ZIP_FILE_NAME ]; then
#         log "Archeival is ... $G SUCCESS $N"

#         while IFS= read -r filepath; do
#         # Process each line here
#         log "Deleting file: $filepath"
#         rm -f $filepath
#         log "Deleted file: $filepath"
#         done <<< $FILES
#     else
#         log "Archeival is ... $R FAILURE $N"
#         exit 1