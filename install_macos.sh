#!/bin/bash

set -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install nvm and the latest node version
# Install vim and Python: https://dev.to/irfnhm/how-to-set-python3-as-a-default-python-version-on-mac-4jjf
# Install iterm2
# $(brew --prefix)/opt/fzf/install

# brew install vim python fzf

# brew cask install iterm2

# ln -s -f /usr/local/bin/python3.7 /usr/local/bin/python
# Install tmux-related tools => https://github.com/JoshOldenburg/tmux-battery, https://github.com/JoshOldenburg/ipaddrutil/blob/master/getipfortmux.c, https://github.com/minhdanh/tmux-macos-network-speed, https://github.com/thewtex/tmux-mem-cpu-load

# Symlink zshrc
[ -e ~/.zshrc ] || ln -s $DIR/macos/shell/zshrc ~/.zshrc

# Symlink zprestorc
[ -e ~/.zpreztorc ] || ln -s $DIR/macos/shell/zpreztorc ~/.zpreztorc

# Symlink vim directory
[ -e ~/.vim ] || ln -s $DIR/vim ~/.vim

# Symlink vimrc
[ -e ~/.vimrc ] || ln -s $DIR/vimrc ~/.vimrc

# Symlink gitconfig
[ -e ~/.gitconfig ] || ln -s $DIR/shell/gitconfig ~/.gitconfig

# Symlink shell prompt
[ -e ~/.shell_prompt.sh ] || ln -s $DIR/shell/shell_prompt.sh ~/.shell_prompt.sh

# Symlink tmux configuration
[ -e ~/.tmux.conf ] || ln -s $DIR/macos/tmux/tmux.conf ~/.tmux.conf
[ -e ~/.tmuxline ] || ln -s $DIR/macos/tmux/tmuxline ~/.tmuxline

# Launch Vim and install plugins
# vim +PlugInstall +qall
