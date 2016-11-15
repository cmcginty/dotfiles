setlocal shiftwidth=4     " set 'shift' size
setlocal softtabstop=4    " set 'tab' size during indent mode
setlocal tabstop=4        " set tab character size

" increase max line length and match
setlocal textwidth=99
setlocal colorcolumn=99
match OverLength /\%100v.*/
