#!/bin/bash

# Install vim, pip, git
sudo apt-get update
sudo apt-get install --yes vim python3-pip git python3-setuptools libpython3-dev

# Install neovim
pip3 install wheel
pip3 install neovim

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install go autocompletion daemon
go get -u github.com/mdempsky/gocode

# Setup .vimrc
ln .vimrc ~/.vimrc

# Install plugins
vim +PlugInstall +GoInstallBinaries +qall
