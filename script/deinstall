#!/bin/bash
#
# usage:
#   deinstall
#
# description:
#   install dein and vim plugin
#
# return:
#    0: succeed
#    1: failed install

# MAIN SCRIPT                          
# -------------------------------------
# this script needs one more arguments.

timeout -sKILL 120 nvim +:q
echo "vim plugin installed"

timeout -sKILL 60 nvim +:q
if [ $? != 0 ]; then 
  echo "Failed to install vim"
  exit 1
fi

echo "completed install vim plugins"
exit 0
