noremap <F3>   :execute "Autoformat" <bar> update<cr>
noremap <S-F3> :bufdo execute "Autoformat" <bar> update<cr>

" add XML formatter for ANT files
let g:formatters_ant = ['tidy_xml']
