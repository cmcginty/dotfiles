" restore last cursor position in files
autocmd BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \     exe "normal! g`\"" |
   \ endif

" except commit messages
autocmd BufReadPost COMMIT_EDITMSG
   \ exe "normal! gg"
