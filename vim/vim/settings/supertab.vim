" Enable "smart" mode for switching between omni-completion mode and regular
" keyword mode. This is necessary for "jedi-vim" plugin to work correctly. See
" docs for more details.
"
" The fallback mode can be modified with g:SuperTabContextDefaultCompletionType
" or call SuperTabSetDefaultCompletionType()
let g:SuperTabDefaultCompletionType = "context"
