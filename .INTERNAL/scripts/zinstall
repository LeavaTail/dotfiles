#!/usr/bin/zsh
#
# usage:
#   zinstall
#
# description:
#   install zprezto.

setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
 		ln -s "$rcfile" "${HOME}/.${rcfile:t}"
done
