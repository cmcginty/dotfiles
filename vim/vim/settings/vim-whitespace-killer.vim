" trim all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" toggle unprintable characters
noremap  <F8>  <C-c>:set list!<cr>
noremap! <F8>  <C-c>:set list!<cr>
