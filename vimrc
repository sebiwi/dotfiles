" Disable vi compatibility
set nocompatible

" Source plugin list
source $HOME/.vim/plug-list.vim

" Source general configuration
source $HOME/.vim/general.vim

" Load plugin settings
for plugin_settings_file in split(globpath('$HOME/.vim/plugin-settings', '*.vim'), '\n')
  exec 'source' plugin_settings_file
endfor

" Source remappings
source $HOME/.vim/remap.vim
