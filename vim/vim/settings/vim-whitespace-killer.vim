" TIP: Use `col` to toggle showing non-printable characters (:setlocal list)

augroup WhiteSpaceKiller
   autocmd!
   " trim all trailing whitespace
   autocmd BufWritePre * :%s/\s\+$//e
   " remove empty lines at end of files
   autocmd BufWritePre * :%s#\($\n\s*\)\+\%$##e
augroup END
