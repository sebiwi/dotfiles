#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create required directories
[ -d ~/.vim/bundle ] || mkdir -p ~/.vim/bundle

# Install Vundle
[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Install The Silver Searcher
# TODO: Add support for CentOS
# OSX
! uname -a | grep -i darwin || brew install the_silver_searcher
# Debian/Ubuntu
! uname -a | grep -i ubuntu || sudo apt-get install silversearcher-ag
# Archlinux
! uname -a | grep -i arch || sudo pacman -S the_silver_searcher

# Symlink colors and plugin directories
[ -e ~/.vim/colors ] || ln -s $DIR/colors ~/.vim/colors
[ -e ~/.vim/plugin ] || ln -s $DIR/plugin ~/.vim/plugin

# Symlink vimrc
[ -e ~/.vimrc ] || ln -s $DIR/vimrc ~/.vimrc

# Launch Vim and install plugins
vim +PluginInstall +qall
