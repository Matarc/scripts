#!/bin/bash

# Install vim-plug
echo 'Installing vim-plug...'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install gocode to use with deoplete
echo 'Installing gocode...'
go get -u github.com/nsf/gocode

# Copy .vimrc
echo 'Copying .vimrc...'
cp .vimrc ~/.vimrc

# Install plugins
echo 'Installing vim plugins...'
vim +PlugInstall +GoInstallBinaries +qall
