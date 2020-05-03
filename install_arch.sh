#!/bin/bash

set -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install dependencies
yay -S i3-gaps rxvt-unicode polybar dmenu rofi \
       compton feh betterlockscreen networkmanager network-manager-applet ranger w3m zathura zathura-pdf-mupdf \
       pulseaudio alsa-utils xorg-xinit xorg-server xorg-xinput xf86-input-libinput light-git \
       nvidia optimux-manager \
       firefox python fzf cmake gvim zsh zsh zsh-completions oh-my-zsh-git the_silver_searcher autojump openssh \
       autojump openssh zsh-dircolors-solarized \
       monaco-powerline-font-git otf-sfmono ttf-google-sans ttf-material-icons-git ttf-font-awesome ttf-ionicons

# Symlink zshrc
[ -e ~/.zshrc ] || ln -s $DIR/arch/shell/zshrc ~/.zshrc

# Symlink vim directory
[ -e ~/.vim ] || ln -s $DIR/vim ~/.vim

# Symlink vimrc
[ -e ~/.vimrc ] || ln -s $DIR/vimrc ~/.vimrc

# Symlink gitconfig
[ -e ~/.gitconfig ] || ln -s $DIR/shell/gitconfig ~/.gitconfig

# Symlink shell prompt
[ -e ~/.shell_prompt.sh ] || ln -s $DIR/shell/shell_prompt.sh ~/.shell_prompt.sh

# Create ~/.config directory
[ -e ~/.config ] || mkdir ~/.config

# Symlink i3 configuration
[ -e ~/.config/i3 ] || ln -s $DIR/arch/config/i3 ~/.config/i3

# Symlink polybar configuration
[ -e ~/.config/polybar ] || ln -s $DIR/arch/config/polybar ~/.config/polybar

# Symlink ranger configuration
[ -e ~/.config/ranger ] || ln -s $DIR/arch/config/ranger ~/.config/ranger

# Symlink rofi configuration
[ -e ~/.config/rofi ] || ln -s $DIR/arch/config/rofi ~/.config/rofi

# Symlink zathura configuration
[ -e ~/.config/zathura ] || ln -s $DIR/arch/config/zathura ~/.config/zathura

# Symlink betterlockscreen configuration
[ -e ~/.config/betterlockscreenrc ] || ln -s $DIR/arch/config/betterlockscreenrc ~/.config/betterlockscreenrc

# Symlink compton configuration
[ -e ~/.config/compton.conf ] || ln -s $DIR/arch/config/compton.conf ~/.config/compton.conf

# Symlink Xresources configuration
[ -e ~/.Xresources ] || ln -s $DIR/arch/X/Xresources ~/.Xresources

# Launch Vim and install plugins
# vim +PlugInstall +qall
