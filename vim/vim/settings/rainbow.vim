let g:rainbow_active = 1

" use autocmd in event syntax is toggled off after buffer loaded
augroup EnableRainbowHighlighting
   autocmd! BufWinEnter * if !empty(&l:filetype) | execute "RainbowToggle" | endif
augroup END
