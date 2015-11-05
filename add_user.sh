#!/bin/bash

echo "****************************************************************"
echo "**********This utility is to multitudinously add user.**********"
echo "**********Usage : ./add_user  argument                **********"
echo "**********Coder : liurui666666@hotmail.com            **********"
echo "**********Date  : 2015/10/27                          **********"
echo "****************************************************************"

echo -n "Enter the user file: "  
read user
echo -n "Enter the suffix of password:"
read suffix

for username in `cat ./$user`
do
	if [ -n $username ]; then

			useradd -m $username
			echo 
			echo $username"$suffix" | passwd --stdin $username
			echo
			echo "User $username's password was changed! "
	else
		echo "user is null!"	
	fi
done
