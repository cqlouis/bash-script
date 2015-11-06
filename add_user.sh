#!/bin/bash

echo "################################################################"
echo "##########This utility is to multitudinously add user.##########"
echo "##########Usage : ./add_user  argument                ##########"
echo "##########Coder : liurui666666@hotmail.com            ##########"
echo "##########Date  : 2015/10/27                          ##########"
echo "################################################################"


echo -n "Enter the user file: "  
read user
echo -n "Enter the suffix of password:"
read suffix
echo -n "Some comments about this user: "
read comment
echo -n "Belong to group: "
read group
groupadd $group 2>/dev/null

for username in `cat ./$user`
do
	if [ -n ${username} ]; then

			useradd -m ${username} -c $comment -g $group  >> out.txt 2>&1 
			echo 
			echo "$username$suffix" | passwd --stdin $username >>out.txt 2>&1
			echo
	else
		echo "user is null!"	
	fi
done
