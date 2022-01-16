#!/bin/bash
#
# usage:
#   checkfile file dotfile
# ex.:
#   checkfile /home/user/dotfile/dist/vim/vimrc /home/user/.vimrc
#
# description:
#   check dotfile is correct deploy.
#
# return:
#    0: succeed
#   -1: command wrong usage
#    1: dotfile is not found.
#    2: link destination is wrong


# usage:
# is_link Base dest
# 
# description
#   check link destination
function is_link() {
	LINKPATH=`readlink -f $2`
	DOTFILE=`basename $1`
		if [ $1 = ${LINKPATH} ]; then
		echo "  ○ \"${DOTFILE}\" is succeed"
	else
		echo "  × \"${DOTFILE}\" is failed"
		echo "     deploying dot file...OK"
		echo "     invalid paths ($2 -> ${LINKPATH})...NG"
	fi
}

# usage:
# is_exist origin dotfile
# 
# description
#   check exist dotfile in home directory
function is_exist() {
	DOTFILE=`basename $2`
	if [[ ! -e $2 ]]; then
		echo "  × \"$2\" is failed"
		echo "     Not found \"${DOTFILE}\"...NG"
		exit 1
	elif [[ -h $2 ]]; then
		is_link $1 $2
	elif [[ -e $2 ]]; then
		echo "  ？ \"$2\" is failed...OK"
		echo "     deploying \"${DOTFILE}\"\. but, file is unsupported...UNKHOWN"
		exit 2
	else
		echo "  ERROR: script was broken."
		exit -1
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

is_exist $1 $2
