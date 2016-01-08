let base16colorspace=256   " access colors present in 256 terminal colorspace
set background=dark        " set dark background colors

" terminal color scheme must be changed to match scheme below for it to work
" when 'vi' is running in terminal
try
   colorscheme base16-default
catch
   colorscheme koehler
endtry

syntax on

" show matching '()' pairs w/ bright-yellow highlight
set showmatch
highlight MatchParen cterm=reverse,bold ctermfg=226  ctermbg=0
highlight MatchParen gui=reverse,bold   guifg=yellow guibg=black
