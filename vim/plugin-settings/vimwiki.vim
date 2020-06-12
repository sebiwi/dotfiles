""""""""""""""""""""""""""""
"   Ack configuration
""""""""""""""""""""""""""""
" Use ~/.vimwiki and markdown
let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Do not shorten URLs
let g:vimwiki_url_maxsave=0

" Open vim configuration in a new tab: Leader + wt (edit vim)
nmap <Leader>wt <Plug>VimwikiTabIndex:lcd $HOME/.vimwiki<cr>
" Leader + r: Render current markdown page
" nnoremap <leader>r :!pandoc % --to=html5 > ~/Downloads/%.html
