#!/bin/bash -eu
#
# usage:
#   check_diff-highlight.sh
#
# description:
#   Check diff-highligh can use

TARGET="diff-highlight"
MANAGER=""

function package_manager() {
	if (type "dpkg" > /dev/null 2>&1); then
		MANAGER="dpkg -L"
	elif (type "rpm" > /dev/null 2>&1); then
		MANAGER="rpm -ql"
	fi
}
#
if (type ${TARGET} > /dev/null 2>&1); then
	exit 0;
fi

package_manager

"WARN: Please check PATH environment variables."
if [ ! -z "$MANAGER" ]; then
	"     ${TARGET} is stored at ..."
	${MANAGER} git | grep "${TARGET}$"
fi

exit 1
