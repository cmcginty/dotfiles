" noremap <F3>   :execute "Autoformat" <bar> update<cr>
noremap <F3>   :Autoformat<cr>:update<cr>
" format all buffers, not just active one
noremap <S-F3> :bufdo execute "Autoformat" <bar> update<cr>

" add XML formatter for ANT files
let g:formatters_ant = ['tidy_xml']

" change default python formatter to yapf
let g:formatter_yapf_style='google'
let g:formatdef_yapf = "'yapf --style={based_on_style:'.g:formatter_yapf_style.',indent_width:'.&shiftwidth.'} -l '.a:firstline.'-'.a:lastline"
let g:formatters_python = ['yapf']
