#!/bin/sh

if [[ -z $1 ]] ; then
	echo "No name specifyed"
	echo "$0 [name] [command]"
	exit 1
fi

export NAME="$1-$UID"

. ~/.safe/env

sudo -H -u $NAME -- ${@:2}
