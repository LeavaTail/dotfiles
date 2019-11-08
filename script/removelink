#!/bin/bash
#
# usage:
#   removelink file dotfile
# ex.:
#   removelink /home/user/dotfile/dist/vim/vimrc /home/user/.vimrc
#
# description:
#   remove dotfile link
#
# return:
#    0: succeed
#   -1: command wrong usage


function rmonlylink() {
	DOTFILE=`basename $2`
	if [[ -h $2 ]]; then
		LINKPATH=`readlink -f $2`
		DOTFILE=`basename $1`
		if [ $1 = ${LINKPATH} ]; then
			echo "  remove dotfile \"${DOTFILE}\""
			rm -rf $2
		fi
	else
		exit 0
	fi
}

# -------------------------------------
# MAIN SCRIPT                          
# -------------------------------------
# this script needs one more arguments.
if [ "$#" != 2 ]; then
	echo "ERROR: command usage was wrong." 1>&2
	exit -1
fi

if [[ ! -e $1 ]]; then
	echo "ERROR: Not found $1." 1>&2
	exit -1
fi

rmonlylink $1 $2
