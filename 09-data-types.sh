#! /bin/bash

NUM1=100
NUM2=rama

SUM=$(($NUM1+$NUM2))

echo "total is $SUM"

cars=("Tata" "Kia" "Hyundai" "Maruthi")

echo "cars are ${cars[@]}"
echo "First car is ${cars[0]}"
echo "Second car is ${cars[1]}"
echo "Third car is ${cars[2]}"
echo "Fourth car is ${cars[3]}"
