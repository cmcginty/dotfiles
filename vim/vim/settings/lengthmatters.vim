" lengthmatters plugin for highlighting long lines

" /w vim-impaired `com` shortcut will also work
nnoremap    =om   <C-c>:LengthmattersToggle<cr>

call lengthmatters#highlight('term=reverse cterm=bold,reverse ctermfg=167 ctermbg=235 '.
                           \ 'gui=bold,reverse guifg=#cc6666 guibg=bg')
