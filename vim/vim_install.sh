#!/bin/bash

case "$(uname -s)" in
	Darwin)
		# Install vim
		echo 'Updating homebrew...'
		brew update
		echo 'Installing vim...'
		brew install vim --with-lua --with-luajit
		;;
	Linux)
		# Install vim, pip, git
		sudo apt-get update
		sudo apt-get install --yes vim python3-pip git python3-setuptools libpython3-dev

		# Install neovim
		pip3 install wheel
		pip3 install neovim
		;;
	*)
		echo "Unknown OS '$(uname -s)' abort"
		exit 1
		;;
esac

# Install and configure vim plugins
echo 'Configuring vim...'
./vim_config.sh
