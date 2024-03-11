#!/usr/bin/env bash 

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

for i in ~/.bashrc.d/*.sh; do
	. "$i"
done; unset i 
