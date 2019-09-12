""""""""""""""""""""""""""""
"  promptline configuration
""""""""""""""""""""""""""""
" Generate with :PromptlineSnapshot <promptfile-name> airline
" Shell prompt: Cloud account > Vitualenv > cwd > < exit code < git branch < kubernetes

" let kubernetes_status = {
"       \'function_name': 'kubernetes_status',
"       \'function_body': [
"         \'function kubernetes_status {',
"         \'  if [ ! -z ${KUBE_ON} ]; then kube_ps1;fi',
"         \'}']}

" let g:promptline_preset = {
"   \'a' : [ promptline#slices#python_virtualenv(), '$GOOGLE_PROJECT', '$AZURE_SUBSCRIPTION', '$AWS_ACCOUNT' ],
"   \'b' : [ promptline#slices#cwd() ],
"   \'y' : [ promptline#slices#vcs_branch() ],
"   \'z' : [ kubernetes_status ],
"   \'warn' : [ promptline#slices#last_exit_code() ]}
