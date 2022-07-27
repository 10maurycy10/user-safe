#!/bin/sh
. safe-config

if [[ -z $1 ]] ; then
	echo "Add a container (run as a normal user)"
	echo "$0 container"
	exit 0
fi

if [[ $UID == 0 ]] ; then
	echo "Dont run it as root"
	exit 1
fi

sudo useradd -g $UID -m -s /bin/nologin -- "$1-$UID"
sudo chmod 770 "/home/$1-$UID"
