let g:rainbow_active = 1

augroup EnableRainbowHighlighting
   " re-enable in case 'syntax' mode is disabled after buffer loaded (e.g. bufdo)
   autocmd! BufRead,BufWinEnter * if !empty(&l:filetype) | execute 'RainbowToggleOn' | endif
augroup END
