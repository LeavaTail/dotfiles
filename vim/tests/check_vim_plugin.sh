#!/bin/bash
#
# usage:
#   check_vim_check
#
# description:
#   check whether vim plugin installed
#
# return:
#    0: succeed
#    1: dein failed install
#    2: easymotion failed install
#    4: webdevicons failed install
#    8: ale failed install
#    16 gitgutter failed install
#    32 lightline failed install

# FUNCITON
#
# this script needs two more arguments.
# $1: logfile name
# $2: return code
function check_plugin() {
	LOGFILE=$1
	ERRCODE=$2

	FAILED=0

	while read LINE
	do
		if [[ $LINE =~ :E[0-9]*: ]]; then
			echo $LINE
			FAILED=1
		fi
	done < $1

	if [ $FAILED -ne 0 ]; then
		ret=`expr $ret + $2`
	fi
}


# MAIN SCRIPT
#
# main function
ret=0

# install success?
timeout -sKILL 30 nvim +:q > /dev/null 2>&1
if [ $? != 0 ]; then
	echo "Failed install dein, Please install again."
	exit 1
fi

# check vim plugin
nvim -V0easymotion.log +"echo g:EasyMotion_keys" +:q
nvim -V0webdevicons.log +"echo g:webdevicons_enable" +:q
nvim -V0ale.log +"echo ale_enabled" +:q
nvim -V0gitgutter.log +"echo gitgutter_enabled" +:q
nvim -V0lightline.log +"echo g:lightline" +:q

#  easymotion plugin check
check_plugin easymotion.log 2
check_plugin webdevicons.log 4
check_plugin ale.log 8
check_plugin gitgutter.log 16
check_plugin lightline.log 32

# cleanup
rm -f ./*.log

exit $ret
