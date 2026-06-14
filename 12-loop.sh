#! /bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "Run this script as Root User"
   exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo "$2 FAILURE"
      exit 1
    else
      echo "$2 SUCCESSFUL"
    fi
}

for PACKAGE in $@
do 
   echo "Installing $PACKAGE"
   dnf install $PACKAGE -y
   VALIDATE $? "$PACKAGE Installation"
done
