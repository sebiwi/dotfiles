""""""""""""""""""""""""""""
"  promptline configuration
""""""""""""""""""""""""""""
" Generate with :PromptlineSnapshot <promptfile-name> airline
" Shell prompt: Cloud account > Vitualenv > cwd > < exit code < git branch < kubernetes
" let g:promptline_preset = {
"   \'a' : [ promptline#slices#python_virtualenv(), '$GOOGLE_PROJECT', '$AZURE_SUBSCRIPTION', '$AWS_ACCOUNT' ],
"   \'b' : [ promptline#slices#cwd() ],
"   \'y' : [ promptline#slices#vcs_branch() ],
"   \'z' : [ '$KUBERNETES_INFO' ],
"   \'warn' : [ promptline#slices#last_exit_code() ]}
