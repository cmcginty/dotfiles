" key mappings for working with files (open, close, save, etc ...)
"  INFO: for consistency, these commands mirror the tmux settings

" save buffer
if has("gui_running")
   nnoremap <leader>s   <C-c>:if expand("%") == ""<cr>:browse confirm saveas<cr>:else<cr>:update<cr>:endif<cr><cr>
   vnoremap <leader>s   <C-c>:if expand("%") == ""<cr>:browse confirm saveas<cr>:else<cr>:update<cr>:endif<cr><cr>
else
   nnoremap <leader>s   <C-c>:update<cr>
   vnoremap <leader>s   <C-c>:update<cr>
endif

" reload buffer, warn if not saved
noremap  <F5>        <C-c>:confirm e<cr>
noremap! <F5>        <C-c>:confirm e<cr>

" new buffer (tmux <C-A>c)
nnoremap <leader>c   <C-c>:enew<cr>
vnoremap <leader>c   <C-c>:enew<cr>

" close buffer (tmux <C-a>x and <C-d>)
nnoremap <leader>x   <C-c>:confirm bd<cr>
vnoremap <leader>x   <C-c>:confirm bd<cr>
nnoremap <C-d>       <C-c>:confirm bd<cr>
vnoremap <C-d>       <C-c>:confirm bd<cr>

" close all tabs/quit (tmux kill-session)
nnoremap <leader>q   <C-c>:confirm qa<cr>
vnoremap <leader>q   <C-c>:confirm qa<cr>
