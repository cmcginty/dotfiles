augroup WhiteSpaceKiller
   " trim all trailing whitespace
   autocmd! BufWritePre * :%s/\s\+$//e
augroup END

" toggle unprintable characters
noremap  <F8>  <C-c>:set list!<cr>
noremap! <F8>  <C-c>:set list!<cr>
