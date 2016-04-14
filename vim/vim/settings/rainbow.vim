let g:rainbow_active = 1

" use autocmd in case 'syntax' mode is disabled after buffer loaded (e.g. bufdo)
augroup EnableRainbowHighlighting
   autocmd!
   autocmd BufWinEnter * if !empty(&l:filetype) | execute 'RainbowToggleOn' | endif
augroup END
