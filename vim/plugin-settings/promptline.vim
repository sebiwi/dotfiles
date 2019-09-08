""""""""""""""""""""""""""""
"  promptline configuration
""""""""""""""""""""""""""""
" Generate with :PromptlineSnapshot <promptfile-name> airline
" Shell prompt: Cloud account > Vitualenv > hostname > user > cwd > git branch > exit code
" let g:promptline_preset = {
"   \'a' : [ promptline#slices#python_virtualenv(), '$GOOGLE_PROJECT', '$AZURE_SUBSCRIPTION', '$AWS_ACCOUNT' ],
"   \'b' : [ promptline#slices#cwd() ],
"   \'y' : [ promptline#slices#vcs_branch() ],
"   \'warn' : [ promptline#slices#last_exit_code() ]}
