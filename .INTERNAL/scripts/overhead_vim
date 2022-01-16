#!/bin/bash
#
# usage:
#   overhead_vim
#
# description:
#   check whether vim overhead is acceptable
#
# return:
#    0: succeed
#   -1: command wrong usage
set -eu

Threshold=1.25
Overhead=`echo "scale=3; $(vim --startuptime /tmp/stime_mine.log -c 'quit' > /dev/null && tail -n 1 /tmp/stime_mine.log | cut -d ' ' -f1) / $(vi -u DEFAULTS --startuptime /tmp/stime_def.log -c 'quit' > /dev/null && tail -n 1 /tmp/stime_def.log | cut -d ' ' -f1)" | bc`

if [ `echo "$Threshold > $Overhead" | bc` == 1 ]; then
	exit 0
fi

echo "${Overhead}x slower your Vim than the default"
exit -1
