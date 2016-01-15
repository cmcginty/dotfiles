" key mappings for working with files (open, close, save, etc ...)
"  INFO: for consistency, these commands mirror the tmux settings

" save buffer
nnoremap <leader>s   <C-c>:call SaveBuffer()<cr>
vnoremap <leader>s   <C-c>:call SaveBuffer()<cr>
noremap  <C-s>       <C-c>:call SaveBuffer()<cr>
inoremap <C-s>       <C-c>:call SaveBuffer()<cr>

" sudo save
nnoremap <leader><S-s>   <C-c>:SudoWrite<cr>
vnoremap <leader><S-s>   <C-c>:SudoWrite<cr>

" reload buffer, warn if not saved
noremap  <F5>        <C-c>:confirm e<cr>
noremap! <F5>        <C-c>:confirm e<cr>

" new buffer (tmux <C-A>c)
nnoremap <leader>c   <C-c>:enew<cr>
vnoremap <leader>c   <C-c>:enew<cr>

" close buffer (tmux <C-a>x and <C-d>)
nnoremap <C-d>       <C-c>:call KillBuffer()<cr>
vnoremap <C-d>       <C-c>:call KillBuffer()<cr>

" close all tabs/quit (tmux kill-session)
nnoremap <leader>q   <C-c>:confirm qa<cr>
vnoremap <leader>q   <C-c>:confirm qa<cr>
