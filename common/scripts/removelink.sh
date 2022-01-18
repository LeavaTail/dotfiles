#!/bin/bash -eu
#
# usage:
#   removelink file
# ex.:
#   removelink /home/user/.vimrc
#
# description:
#   remove dotfile link if files is one of the dotfiles
#
# return:
#    0: succeed
#    1: command wrong usage

# Invalid usage
if [ "$#" != 1 ]; then
	echo "ERROR: command usage was wrong." 1>&2
	exit 1
fi

CURRENT=$(realpath "$(dirname ${BASH_SOURCE})")
${CURRENT}/checkfile.sh $1 | grep '[*]'
if [ $? = 0 ]; then
	rm -f $1
fi
