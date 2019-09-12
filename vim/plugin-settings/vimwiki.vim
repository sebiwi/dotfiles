""""""""""""""""""""""""""""
"   Ack configuration
""""""""""""""""""""""""""""
" Use ~/.vimwiki and markdown
let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Leader + r: Render current markdown page
nnoremap <leader>r :!pandoc % --to=html5 > ~/Downloads/%.html
