" format buffer or visual selection
nnoremap <leader>f   :Autoformat<cr>:update<cr>
vnoremap <leader>f   :Autoformat<cr>:udpate<cr>
" format all buffers, not just active one
nnoremap <leader>F   :bufdo execute "Autoformat" <bar> update<cr>

" add XML formatter for ANT files
let g:formatters_ant = ['tidy_xml']
