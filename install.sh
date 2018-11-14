#!/bin/bash

# Install go
if [ -x "$(command -v go)" ]; then
	echo 'go is already installed'
else
	echo 'go is not installed and you were too lazy to automize this'
	exit 1
fi

# Install vim
./vim_install.sh
