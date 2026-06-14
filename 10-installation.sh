#! /bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Run this script as root user"
   exit 1
fi 

echo "Instatlling Nginx"
dnf install nginxxxx -y

if [ $? -ne 0 ]; then
   echo "Installing Nginx is FAILURE"
   exit 1
else
   echo "Installing Nginx is SUCCESS"
fi