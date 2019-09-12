""""""""""""""""""""""""""""
"   Ack configuration
""""""""""""""""""""""""""""
" Use the Silver Searcher instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Don't jump to first result
cnoreabbrev Ack Ack!

" Search: Leader + a (ack)
nnoremap <leader>ac :Ack!<space>
