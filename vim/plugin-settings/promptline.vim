""""""""""""""""""""""""""""
"  promptline configuration
""""""""""""""""""""""""""""
" Generate with :PromptlineSnapshot <promptfile-name>
" Shell prompt: Vitualenv > hostname > user > cwd > git branch > exit code

if exists('g:loaded_promptline_plugin')
  let g:promptline_preset = {
    \'a' : [ promptline#slices#python_virtualenv() ],
    \'b' : [ promptline#slices#host({ 'only_if_ssh': 1 }), promptline#slices#user() ],
    \'c' : [ promptline#slices#cwd() ],
    \'y' : [ promptline#slices#vcs_branch() ],
    \'warn' : [ promptline#slices#last_exit_code() ]}
endif
