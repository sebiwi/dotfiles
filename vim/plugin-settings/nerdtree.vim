""""""""""""""""""""""""""""
"  NERDTree configuration
""""""""""""""""""""""""""""
" Open NERDTree: Leader + t (tree)
nnoremap <leader>t :NERDTree<cr>
nnoremap <leader>oc :NERDTreeFind<cr>

" Ignore .pyc files
let NERDTreeIgnore = ['\.pyc$', '\.git']

" Show hidden files
let NERDTreeShowHidden=1
