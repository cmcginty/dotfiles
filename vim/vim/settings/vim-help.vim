augroup VimHelpIntegration
   " disable buffer prev/next during 'help'
   autocmd! BufEnter *
      \ if (&l:filetype ==? 'help') |
      \     unmap <buffer> <C-h>|
      \     unmap <buffer> <C-l>|
      \ endif
augroup END
