#!/bin/bash
#
# usage:
#   deadlink dir...
#
# description:
#   Remove the deadlink

# this script needs one more arguments.
if [ "$#" -lt 1 ]; then
	echo "usage: deadlink dir..." 1>&2
	exit 1
fi
for arg in "${@:-$HOME}"
do
# serach deadlink. store return value.
	array=`find -L $arg -type l`
	if [ $? = 0 ]; then
		for f in $array; do
# entity function. remove deadlink
			rm -vf "$f"
		done
	fi
done
