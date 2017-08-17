let base16colorspace=256   " access colors present in 256 terminal colorspace
set background=dark        " set dark background colors
set showmatch              " show matching '()' pairs

" Color Scheme Override
" ---------------------------------------------
" Set darker backround than default
" let g:colorsbox_contrast_dark = 'hard'
" Set gitgutter column background to default background color
" let g:colorsbox_sign_column = 'bg0'
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

" use autocmd to override the color scheme or when 'syntax' mode is toggled
augroup CustomColorScheme
   autocmd!

   " set parenthesis matching colors
   au VimEnter,ColorScheme * hi! MatchParen cterm=bold ctermfg=226
   au VimEnter,ColorScheme * hi! MatchParen gui=bold   guifg=#d2d22d

   " reduce contrast to line number
   au VimEnter,ColorScheme * hi! link LineNr colorsboxBg1

   " comment block text
   au VimEnter,ColorScheme * hi! link Comment colorsboxFg4

   " literal numbers
   au VimEnter,ColorScheme * hi! Number    cterm=bold ctermfg=16
   au VimEnter,ColorScheme * hi! Number    gui=bold guifg=#d2d22d
   au VimEnter,ColorScheme * hi! Float     cterm=bold ctermfg=16
   au VimEnter,ColorScheme * hi! Float     gui=bold guifg=#d2d22d

   " extended symbol operators (e.g. + - = < > ! * /)
   " NOTE: supported operators are customized in local syntax/* files
   au VimEnter,ColorScheme * hi! ExtraOperator ctermfg=9
   au VimEnter,ColorScheme * hi! ExtraOperator guifg=#dc9656

   " change spelling errors to just curly underlines
   au VimEnter,ColorScheme * hi! SpellBad gui=undercurl,bold guibg=NONE guisp=#cc6666
   au VimEnter,ColorScheme * hi! SpellBad cterm=undercurl,reverse
   au VimEnter,ColorScheme * hi! SpellCap gui=undercurl,bold guibg=NONE guisp=#8abeb7
   au VimEnter,ColorScheme * hi! SpellCap cterm=undercurl,reverse
augroup END
