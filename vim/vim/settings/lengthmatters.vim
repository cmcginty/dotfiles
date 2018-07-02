" lengthmatters plugin for highlighting long lines

" match vim-unimpaired `yo` toggle style
nnoremap    yom   <C-c>:LengthmattersToggle<cr>

call lengthmatters#highlight('term=reverse cterm=bold,reverse ctermfg=167 ctermbg=235 '.
                           \ 'gui=bold,reverse guifg=#cc6666 guibg=bg')
