#!/bin/sh

if [[ -z $1 ]] ; then
	echo "Removes a user and all usersafe files"
	echo 'THIS WILL DELETE THE HOME DIRECTORY!'
	echo "$0 [username]"
	exit 0
fi

if [[ $UID != 0 ]] ; then
	echo "Run this script as root"
	exit 1
fi

if not id -- $1 ; then
	echo "That user does not exist"
	exit 1
fi

PRIMARY_GID=$(id -g $1)

echo -n "Remove '$1' [Y to confirm]? "

read input

[[ "$input" == 'Y' ]] && userdel -r -- $1

USERS_TO_REMOVE=$(awk -F: "\$4==\"$PRIMARY_GID\" {print \$1}" < /etc/passwd)

echo "THE FOLOWING USERS WILL BE DELETED"

echo $USERS_TO_REMOVE

echo -n "'Y' to confirm: "

read input

if [[ "$input" == 'Y' ]] ; then
       echo $USERS_TO_REMOVE | xargs -n 1 userdel -r -- || exit 1
fi

groupdel -- $1 || exit 1

#rm "/etc/sudoers.d/user-safe-$1"

echo "Done"
