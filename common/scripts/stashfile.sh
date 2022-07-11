#!/bin/bash -eu
#
# usage:
#   stashfile config1 config2 ...
# ex.:
#   stashfile tig tmux vim zsh
#
# description:
#   stash dotfile in advance
#
# return:
#    0: succeed

DIR=".trash"
DELIVERABLES="docs/Deliverables.txt"
NEED_DELETE=0

function __stash() {
	if [ ${NEED_DELETE} -eq 1 ]; then
		echo "Warning: stash files will be removed" 1>&2
		pushd ${DIR}
		rm -rf `ls -A -1 .`
		popd
		NEED_DELETE=0
	fi
	mv $1 ${DIR}/
}

function stash () {
	while read line
	do
		if [ -e ${HOME}/${line} ]; then
			__stash ${HOME}/${line}
		fi
	done < $1
}

# Trash is exsit or not
if [ ! -d ${DIR} ]; then
	mkdir -p ${DIR}
elif [ -n "${DIR}" ]; then
	NEED_DELETE=1
fi

while [ $# -gt 0 ] ; do
	if [ -e $1/${DELIVERABLES} ]; then
		stash $1/${DELIVERABLES}
	fi
	shift
done
