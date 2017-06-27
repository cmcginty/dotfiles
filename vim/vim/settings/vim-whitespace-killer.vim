augroup WhiteSpaceKiller
   autocmd!
   " trim all trailing whitespace
   autocmd BufWritePre * :%s/\s\+$//e
   " remove empty lines at end of files
   autocmd BufWritePre * :%s#\($\n\s*\)\+\%$##e
augroup END

" toggle unprintable characters
noremap  <F8>  <C-c>:set list!<cr>
noremap! <F8>  <C-c>:set list!<cr>
