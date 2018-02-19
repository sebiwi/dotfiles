""""""""""""""""""""""""""""
"  promptline configuration
""""""""""""""""""""""""""""
" Generate with :PromptlineSnapshot <promptfile-name>
" Shell prompt: Cloud account > Vitualenv > hostname > user > cwd > git branch > exit code
let g:promptline_preset = {
  \'a' : [ promptline#slices#python_virtualenv(), '$AZURE_SUBSCRIPTION', '$AWS_ACCOUNT' ],
  \'b' : [ promptline#slices#host({ 'only_if_ssh': 1 }), promptline#slices#user() ],
  \'c' : [ promptline#slices#cwd() ],
  \'y' : [ promptline#slices#vcs_branch() ],
  \'warn' : [ promptline#slices#last_exit_code() ]}
