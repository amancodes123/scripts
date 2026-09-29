#!/bin/bash

<<info

this shell script chek if the user exists

info

read -p "Enter the username you wish to check " username

count=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

if [ "$count" == 0 ]; then
	echo “user does not exist”
else
	echo “user exists”
fi
