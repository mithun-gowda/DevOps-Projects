#!/bin/bash

############
# Author: Mithun Gowda
# Date: 04-03-2024
#
# Version: v1
#
# This is script which will retrive data from user 
# Here Entering password is not visible becauuse of -sp 

echo Welcome to Console

match=false

while [[ $match = false ]]; do

	echo "Enter your contact number!"
	read no
	echo "confirm contact number!"
	read reno

	if [[ $no = $reno ]]; then
		echo "Enter $no is correct"
		match=true
	else
		echo "Check again!"
	fi
done

read -p 'name' name

echo Hi, $name

read -p 'Username:' uservar
read -sp 'Password:' passvar

echo Thankyou $uservar we now have your user details

echo Here is the details of process
top
