#! /bin/bash

# A simple script to set the configured user.
# Usage - ./set-user.sh <user> <old-user> <old-user-id>
# Running with no parameters configures for the current user.
# Running with the user USER resets the configuration files, for debug purposes.

# This file is licensed under the MIT License, copyright 2021 Vaughan Milliman.

if [ -z "$2" ]; then
	REPLACE_USER=USER
	REPLACE_USERID=USERID
elif [ -z "$3" ]; then
	REPLACE_USER=$2
	REPLACE_USERID=$(id -u $2)
else
	REPLACE_USER=$2
	REPLACE_USERID=$3
fi

if [ -n "$1" ]; then
	if [ "$1" == "USER" ]; then
		USERID="USERID"
	else
		USERID=$(id -u "$1")
	fi
else
	USERID=$(id -u "$USER")
fi

sed -i -e "s/ $REPLACE_USER/ $1/g" volume.sh

sed -i -e s/$REPLACE_USERID/$USERID/g volume.sh
