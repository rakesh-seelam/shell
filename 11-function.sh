#! /bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "Run script as root user"
   exit 1
fi

VALIDATE(){
   if [ $1 -ne 0 ]; then
  echo "$2 installation FAILURE"
  exit 1
else
  echo "$2 installation SUCCESS"
fi
}

echo "Installing Nginx"
dnf install nginx -y
VALIDATE $? "Nginx Installation"

echo "Installing Mysql"
dnf install mysql -y
VALIDATE $? "mysql Installation"

