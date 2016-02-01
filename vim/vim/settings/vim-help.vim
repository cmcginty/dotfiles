" disable buffer prev/next during 'help'
autocmd BufEnter *
   \ if (&filetype == 'help') |
   \     unmap <buffer> <C-h>|
   \     unmap <buffer> <C-l>|
   \ endif
