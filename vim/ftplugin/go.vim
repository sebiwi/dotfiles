" Go specific settings
setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal noexpandtab

" Run Go: Leader + r (run)
autocmd FileType go nmap <localleader>r <Plug>(go-run)

" Build Go: Leader + b (run)
autocmd FileType go nmap <localleader>b <Plug>(go-build)

" Test Go: Leader + t (test)
autocmd FileType go nmap <localleader>t <Plug>(go-test)

" Coverage Go: Leader + c (coverage)
autocmd FileType go nmap <localleader>c <Plug>(go-coverage)
