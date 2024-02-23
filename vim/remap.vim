""""""""""""""""""""""""""""
"     .vimrc-specific
""""""""""""""""""""""""""""
" Open vim configuration in a new tab: Leader + ev (edit vim)
nnoremap <leader>ev :tabedit $MYVIMRC<cr>:lcd $HOME/stuff/dotfiles<cr>

" Source vim configuration inmediatly: Leader + sv (source vim)
nnoremap <leader>sv :source $MYVIMRC<cr>

""""""""""""""""""""""""""""
"    Copy/Paste shortcuts
""""""""""""""""""""""""""""
" Yank text to the OS X clipboard
noremap <leader>y "+y
noremap <leader>yy "+Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  +<CR>:set nopaste<CR>

""""""""""""""""""""""""""""
"       Movement
""""""""""""""""""""""""""""
"" Window movement

" Ctrl + h: Move left
nnoremap <c-h> <c-w>h

" Ctrl + j: Move down
nnoremap <c-j> <c-w>j

" Ctrl + k: Move up
nnoremap <c-k> <c-w>k

" Ctrl + l: Move right
nnoremap <c-l> <c-w>l

""""""""""""""""""""""""""""
"         Search
""""""""""""""""""""""""""""
" Disable highlight after search is done: Leader + space
nnoremap <leader><space> :noh<cr>

" Replace highlighted word in the current file
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

""""""""""""""""""""""""""""
"       Spelling
""""""""""""""""""""""""""""
" Toggle spell checking with: Leader + s (spelling)
noremap <silent> <leader>s :set spell!<cr>

""""""""""""""""""""""""""""
"       Text Editing
""""""""""""""""""""""""""""
" Remove trailing whitespaces: Leader + W (whitespaces)
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Format JSON
nnoremap <leader>fj :%!python -m json.tool<cr>

""""""""""""""""""""""""""""
"         Diff
""""""""""""""""""""""""""""
" Select split for diff
nnoremap <leader>dt :windo diffthis<cr>
" Disable diffs
nnoremap <leader>do :windo diffoff<cr>

""""""""""""""""""""""""""""
"         Zoom
""""""""""""""""""""""""""""
" Zoom on pane
noremap Zi <c-w>_ \| <c-w>\|
" Zoom out
noremap Zo <c-w>=
