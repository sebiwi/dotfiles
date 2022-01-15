""""""""""""""""""""""""""""
"   vimwiki configuration
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

" Do not consider every markdown file as a vimwiki file
let g:vimwiki_global_ext = 0
let g:vimwiki_folding = 'expr'

hi link VimwikiHeader1 pandocBlockQuoteLeader3
hi link VimwikiHeader2 pandocBlockQuoteLeader4
hi link VimwikiHeader3 pandocBlockQuoteLeader2
