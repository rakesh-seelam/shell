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
DAYS={3:-14} #default days 14

if [ USERID -ne 0 ]; then
   echo -e "$R Run this script as root user $N"
   exit 1
fi
 
USAGE(){
    echo -e "$R Usage: <SOURCE_DIR> <DEST_DIR> <DAYS>[Default 14] $N"
    exit 1
}

if [ $# -lt 2 ]; then
   USAGE
fi