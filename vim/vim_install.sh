#!/bin/bash

# Save script directory
SCRIPTDIR=$PWD

# Uninstall every instance of vim
sudo apt-get remove --purge --yes vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common

# Install dependencies
sudo apt-get update
sudo apt-get install --yes liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev

cd ~/Downloads

# Delete previous version of vim
rm -rf vim

# Download last version of vim
git clone --depth=1 https://github.com/vim/vim

# Configure and install vim
cd vim/src

make distclean

./configure --with-features=huge --enable-rubyinterp --enable-largefile --disable-netbeans --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu --enable-perlinterp --enable-luainterp --with-luajit --enable-fail-if-missing --enable-cscope

make

sudo make install

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Setup .vimrc
cd $SCRIPTDIR
cp .vimrc ~/.vimrc

# Setup neocomplete configuration
cp -R matgames ~/.vim/

# Install plugins
vim +PluginInstall +GoInstallBinaries +qall
