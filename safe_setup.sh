#!/bin/sh
. safe-config

if [[ -z $1 ]] ; then
	echo "Sets up a privalaged user for use with user_safe"
	echo "$0 [username]"
	exit 0
fi

if [[ $UID != 0 ]] ; then
	echo "Run this script as root"
	exit 1
fi

if id -- $1 ; then
	echo "That user already exists, skiping creation"
	exit 1
fi

useradd -m -k $ETCDIR/safe-template -- $1 || exit 1

echo "$1 ALL=(ALL) NOPASSWD: ALL" >> "/etc/sudoers.d/user-safe-$1"

echo "Enter passwd for the new user ($1)"

passwd -- $1
