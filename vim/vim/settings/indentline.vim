" set indentline style
let g:indentLine_char = '│'
let g:indentLine_color_term = 66
let g:indentLine_color_gui = '#4f5b66'

" fix performance issue with long lines
let g:indentLine_faster = 1

augroup IndentLineIntegration
   autocmd!
   " BUG: prevent NERDTreeToggle from disabling IndentLines
   " if not in the NERDTree buffer, try to reset indents
   autocmd BufEnter *   if !exists("b:NERDTree") | exec "IndentLinesReset" | endif
augroup END
