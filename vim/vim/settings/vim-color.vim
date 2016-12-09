let base16colorspace=256   " access colors present in 256 terminal colorspace
set background=dark        " set dark background colors
set showmatch              " show matching '()' pairs

" terminal color scheme must be changed to match scheme below for it to work
" when 'vi' is running in terminal
try
   colorscheme jellybeans
   " try these other colors (from low -> high saturation)
   "     base16-eighties -> base16-chalk -> base16-monokai
   "     base16-twilight -> base16-default -> base16-tomorrow-night -> base16-bright
   "
   "     colorsbox-material
   "     colorsbox-stnight
   "     hybrid
   "     luna
   "     molokai
catch
   colorscheme koehler
endtry

" NOTE: MatchParen can be replaced by colorscheme. Not sure how to force this as
"       the default.
highlight MatchParen cterm=bold ctermfg=0  ctermbg=226
highlight MatchParen gui=bold   guifg=black guibg=yellow

" highlight lines longer than N-1 characters
highlight OverLength guibg=#341818
match OverLength /\%91v.*/ " highlight lines longer than 90 characters

" use autocmd to override the color scheme or when 'syntax' mode is toggled
augroup CustomColorScheme
   autocmd!
   " add contrast to line number
   au VimEnter,ColorScheme * hi LineNr    ctermfg=8 ctermbg=18 guifg=#484848 guibg=#242424
   " java 'new', 'instanceof'
   au VimEnter,ColorScheme * hi Operator  ctermfg=5
   au VimEnter,ColorScheme * hi Operator  guifg=#d175bc
   " java 'this', 'super'
   au VimEnter,ColorScheme * hi Typedef   ctermfg=8
   au VimEnter,ColorScheme * hi Typedef   guifg=#ab4642
   " java 'void', 'int', 'double'
   au VimEnter,ColorScheme * hi Type      ctermfg=4
   au VimEnter,ColorScheme * hi Type      guifg=#7cafc2
   " literal numbers
   au VimEnter,ColorScheme * hi Number    cterm=bold ctermfg=16
   au VimEnter,ColorScheme * hi Number    gui=bold   guifg=#d2d22d
   " extended symbol operators (e.g. + - = < > ! * /)
   " NOTE: supported operators are customized in local syntax/* files
   au VimEnter,ColorScheme * hi ExtraOperator ctermfg=9
   au VimEnter,ColorScheme * hi ExtraOperator guifg=#dc9656
augroup END
