""""""""""""""""""""""""""""
"  tmuxline configuration
""""""""""""""""""""""""""""
let g:tmuxline_preset = {
    \'a'       : '#S:#I',
    \'b disabled'       : '',
    \'c disabled'       : '',
    \'win'     : ['#I', '#W'],
    \'cwin'    : ['#I', '#W'],
    \'x'       : ['#(tmux-battery)', '#(/bin/bash ~/stuff/bin/kube-tmux 250 red cyan)'],
    \'y'       : ['%a', '%Y-%m-%d', '%l:%M%p'],
    \'z'       : ['#(whoami)', '#(getipfortmux || echo raspi)'],
    \'options' : {'status-justify': 'left'}}
