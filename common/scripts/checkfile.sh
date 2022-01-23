#!/bin/bash -eu
#
# usage:
#   checkfile file dotfile
# ex.:
#   checkfile /home/user/.vimrc
#
# description:
#   check dotfile is correct deploy.
#
# return:
#    0: succeed
#    1: command wrong usage

# Invalid usage
if [ "$#" != 1 ]; then
	echo "ERROR: command usage was wrong." 1>&2
	exit 1
fi

CHAR=' '
# symlink check
if [[ -L $1 ]]; then
	CURRENT=$(realpath "$(dirname ${BASH_SOURCE})")
	DOTDIR=$(dirname "$(dirname ${CURRENT})")
	SOURCE=$(readlink $1)

	case ${SOURCE} in
		${DOTDIR}*)
			CHAR='*'
			;;
		*)
			CHAR='?'
			;;
	esac
fi

echo "[${CHAR}] $1"
