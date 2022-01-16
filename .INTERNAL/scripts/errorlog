#!/bin/bash
#
# usage:
#   errorlog
#
# description:
#   Output error message.
#
# return:
#    0: no error
#    1: exist error message
# -------------------------------------
# MAIN SCRIPT                          
# -------------------------------------
ret=0
ESC=$(printf '\033')

for file in *; do
  if [[ ${file} =~ error.*\.log ]]; then
    ret=1
  fi
done

if [ ${ret} -eq 0 ]; then
  echo "${ESC}[32msuccess: installed dotfiles.${ESC}[m"
  exit 0
else
  echo "${ESC}[31mFailed:  check and delete error log.${ESC}[m"
  exit 1
fi
