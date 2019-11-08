#!/bin/bash
#
# usage:
#   checkpackage application
# ex.:
#   checkfile vim
#
# description:
#   check package is installed your system.
#
# return:
#        0: succeed
# Negative: usage error
# Positive: some packages are not found

ret=0
# -------------------------------------
# MAIN SCRIPT                          
# -------------------------------------
# this script needs one more arguments.
function check() {
	while read command
	do
		if (type ${command} > /dev/null 2>&1); then
			echo "  ○ \"${command}\" is found"
		else
			echo "  × \"${command}\" is NOT found"
			ret=$(( ret + 1 ))
		fi
	done < $1
}

if [ "$#" != 1 ]; then
echo "ERROR: command usage was wrong." 1>&2
exit -1
fi

if [ -d $1 ]; then
	while read -d $'\0' file; do
    	check ${file}
	done < <(find $1 -mindepth 1 -maxdepth 1 -print0)
else
	echo "ERROR: directory not found." 1>&2
	exit -2
fi

if [ $ret -ne 0 ]; then
	echo "ERROR: please install these package." 1>&2
	exit $ret
fi

exit 0
