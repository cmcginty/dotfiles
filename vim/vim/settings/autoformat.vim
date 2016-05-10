noremap <F3>   :Autoformat<cr>:update<cr>
" format all buffers, not just active one
noremap <S-F3> :bufdo execute "Autoformat" <bar> update<cr>

" add XML formatter for ANT files
let g:formatters_ant = ['tidy_xml']

" change default YAPF (python) formatter style
let g:formatter_yapf_style='google'
