let g:rainbow_active = 1

augroup EnableRainbowHighlighting
   " re-enable in case 'syntax' disabled after buffer loaded (e.g.  bufdo)
   autocmd! BufRead,BufWinEnter *
            \ if !empty(&l:filetype) |
            \     exe 'RainbowToggle' |
            \     exe 'RainbowToggleOn' |
            \ endif
augroup END
