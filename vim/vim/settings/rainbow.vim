let g:rainbow_active = 1

let g:rainbow_conf = {
\  'guifgs': [
\     '#4da6ff',
\     '#fa6299',
\     '#94db33',
\     '#AE81FF',
\     '#f5e619',
\     '#66D9EF',
\     '#FD971F',
\  ]
\}

augroup EnableRainbowHighlighting
   " re-enable in case 'syntax' disabled after buffer loaded (e.g.  bufdo)
   autocmd! BufRead,BufWinEnter *
            \ if !empty(&l:filetype) |
            \     exe 'RainbowToggle' |
            \     exe 'RainbowToggleOn' |
            \ endif
augroup END
