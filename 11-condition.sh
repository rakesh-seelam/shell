#! /bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "Run script as root user"
   exit 1
fi

echo "Installing Nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
  echo "Nginx installation FAILURE"
  exit 1
else
  echo "Nginx installation SUCCESS"
fi

echo "Installing Mysql"
dnf install mysql -y

if [ $? -ne 0 ]; then
  echo "mysql installation FAILURE"
  exit 1
else
  echo "mysql installation SUCCESS"
fi

