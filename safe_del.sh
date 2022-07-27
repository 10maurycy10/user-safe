#!/bin/sh
. safe-config

if [[ -z $1 ]] ; then
	echo "remove a container (run as a normal user)"
	echo "$0 container"
	exit 0
fi

if [[ $UID == 0 ]] ; then
	echo "Dont run it as root"
	exit 1
fi

if not id $1-$UID ; then
	echo 'That does not exist.'
	exit 1
fi

sudo userdel -r -- "$1-$UID"

exit 0
