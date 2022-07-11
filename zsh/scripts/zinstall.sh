#!/usr/bin/zsh
#
# usage:
#   zinstall
#
# description:
#   install zprezto.
rm -vrf ${HOME}/.zsh*

setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
 		ln -s "$rcfile" "${HOME}/.${rcfile:t}"
done
