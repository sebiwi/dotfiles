""""""""""""""""""""""""""""
"    gitgutter
""""""""""""""""""""""""""""
" Update marks on save
autocmd BufWritePost * GitGutter

highlight clear SignColumn
call gitgutter#highlight#define_highlights()
