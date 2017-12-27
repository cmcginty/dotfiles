" Enable "smart" mode for switching between omni-completion mode and regular
" keyword mode. This is necessary for "jedi-vim" plugin to work correctly. See
" docs for more details.
"
" The fallback mode can be modified with g:SuperTabContextDefaultCompletionType
" or call SuperTabSetDefaultCompletionType()
let g:SuperTabDefaultCompletionType = "context"

" During completion, a small preview windows is opened, but does not close
" automatically. This setting will remove the preview pane after completion.
let g:SuperTabClosePreviewOnPopupClose = 1
