#! /bin/bash

USER_ID=(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Run this script as root user"
else
   echo "Instatlling Nginx"
fi 

dnf install nginx -y