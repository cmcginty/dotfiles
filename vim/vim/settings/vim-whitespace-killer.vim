" trim all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" toggle unprintable characters
noremap  <F3>  <C-c>:set list!<cr>
noremap! <F3>  <C-c>:set list!<cr>
