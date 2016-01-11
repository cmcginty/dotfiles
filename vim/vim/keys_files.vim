" key mappings for working with files (open, close, save, etc ...)
"  INFO: for consistency, these commands mirror the tmux settings

" save buffer
if has("gui_running")
   " if unnamed buffer, open save dialog
   command GuiUpdate
         \  if empty(bufname('%')) |
         \     browse confirm update |
         \  else |
         \     update |
         \  endif
   nnoremap <leader>s   <C-c>:GuiUpdate<cr>
   vnoremap <leader>s   <C-c>:GuiUpdate<cr>
   noremap  <C-s>       <C-c>:GuiUpdate<cr>
   inoremap <C-s>       <C-c>:GuiUpdate<cr>
else
   nnoremap <leader>s   <C-c>:update<cr>
   vnoremap <leader>s   <C-c>:update<cr>
   noremap  <C-s>       <C-c>:update<cr>
   inoremap <C-s>       <C-c>:update<cr>
endif

" reload buffer, warn if not saved
noremap  <F5>        <C-c>:confirm e<cr>
noremap! <F5>        <C-c>:confirm e<cr>

" new buffer (tmux <C-A>c)
nnoremap <leader>c   <C-c>:enew<cr>
vnoremap <leader>c   <C-c>:enew<cr>

" exit vim when if last buffer is closed
command BDeleteAndQuit
      \  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1 |
      \     confirm bd |
      \  else |
      \     confirm qa |
      \  endif
" close buffer (tmux <C-a>x and <C-d>)
nnoremap <leader>x   <C-c>:BDeleteAndQuit<cr>
vnoremap <leader>x   <C-c>:BDeleteAndQuit<cr>
nnoremap <C-d>       <C-c>:BDeleteAndQuit<cr>
vnoremap <C-d>       <C-c>:BDeleteAndQuit<cr>

" close all tabs/quit (tmux kill-session)
nnoremap <leader>q   <C-c>:confirm qa<cr>
vnoremap <leader>q   <C-c>:confirm qa<cr>
