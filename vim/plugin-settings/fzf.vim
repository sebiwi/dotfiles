""""""""""""""""""""""""""""
"    fzf configuration
""""""""""""""""""""""""""""
" Fulltext:
nnoremap <leader>g :Ag<cr>

" Files:
nnoremap <c-p> :Files<cr>

" Fzf window on down split
let g:fzf_layout = { 'down': '~40%' }

" Remove filenames from Ag search results
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Add Raw ag (Rag) command to search on a particular directory
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
