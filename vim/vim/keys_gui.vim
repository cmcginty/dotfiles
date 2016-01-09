" key mappings upgrade for gvim

if has("gui_running")
   " save file as ...
   noremap  <C-A-s> <C-c>:browse w<cr>
   noremap! <C-A-s> <C-c>:browse w<cr>

   " find & replace
   nnoremap <C-r>      :promptrep <C-r><C-w><cr>
   inoremap <C-r> <C-o>:promptrep <C-r><C-w><cr>
   vnoremap <C-r>     y:promptrep <C-r>=escape(@", '\\/.*$^~[]')<cr><cr>
endif
