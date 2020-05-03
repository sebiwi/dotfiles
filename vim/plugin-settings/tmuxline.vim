""""""""""""""""""""""""""""
"  tmuxline configuration
""""""""""""""""""""""""""""
" Generate with :TmuxlineSnapshot <promptfile-name>

let g:tmuxline_preset = {
    \'a'       : '#S:#I',
    \'b disabled'       : '',
    \'c disabled'       : '',
    \'win'     : ['#I', '#W'],
    \'cwin'    : ['#I', '#W'],
    \'x'       : ['#(tmux-battery)', '#(tmux-mem-cpu-load -m 2 -t 1 -a 0 -g 0)', '#{network_speed}'],
    \'y'       : ['%a', '%Y-%m-%d', '%l:%M%p'],
    \'z'       : ['#(getipfortmux || echo raspi)'],
    \'options' : {'status-justify': 'left'}}
