#!/bin/csh

if ( $?VSCODE_GIT_IPC_HANDLE ) then
	echo "Opening file in VSCode"
	code $argv:q
else
	echo "Opening file in gvim"
	/usr/intel/bin/gvim $argv:q
endif
