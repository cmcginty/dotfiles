let base16colorspace=256   " access colors present in 256 terminal colorspace
set background=dark        " set dark background colors
set showmatch              " show matching '()' pairs

" Color Scheme Override
" ---------------------------------------------
" Set darker backround than default
let g:colorsbox_contrast_dark = 'hard'
" Set gitgutter column background to default background color
let g:colorsbox_sign_column = 'bg0'
" Invert gitgutter colors
let g:colorsbox_invert_signs = 0

" terminal color scheme must be changed to match scheme below for it to work
" when 'vi' is running in terminal
try
   " colorscheme jellybeans
   colorscheme colorsbox-stnight
   " colorscheme colorsbox-stbright

   " try these other colors (from low -> high saturation)
   "     base16-eighties -> base16-chalk -> base16-monokai
   "     base16-twilight -> base16-default -> base16-tomorrow-night -> base16-bright
   "
   "     basic-dark
   "     colorsbox-material
   "     colorsbox-stnight
   "     hybrid
   "     luna
   "     molokai
   "     monokai-soda
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
   " reduce contrast to line number
   au VimEnter,ColorScheme * hi LineNr     ctermfg=8 guifg=#404040

   " literal numbers
   au VimEnter,ColorScheme * hi Number    cterm=bold ctermfg=16
   au VimEnter,ColorScheme * hi Number    gui=bold   guifg=#d2d22d

   " extended symbol operators (e.g. + - = < > ! * /)
   " NOTE: supported operators are customized in local syntax/* files
   au VimEnter,ColorScheme * hi ExtraOperator ctermfg=9
   au VimEnter,ColorScheme * hi ExtraOperator guifg=#dc9656

   " change spelling errors to just curly underlines
   au VimEnter,ColorScheme * hi SpellBad gui=undercurl guibg=NONE guisp=#cc6666
   au VimEnter,ColorScheme * hi SpellCap gui=undercurl guibg=NONE guisp=#8abeb7
augroup END
