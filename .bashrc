#!/usr/bin/env bash 

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

if [ -f /home/ivra0940/.local/share/pipx/venvs/liftcli/shell/bash/bashrc ]; then source /home/ivra0940/.local/share/pipx/venvs/liftcli/shell/bash/bashrc; fi
for i in ~/.bashrc.d/*.sh; do
	. "$i"
done; unset i 
export PATH=$PATH:/snap/bin
