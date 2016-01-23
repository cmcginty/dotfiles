" key mappings for working with files (open, close, save, etc ...)
"  INFO: for consistency, these commands mirror the tmux settings

" helper to quickly change the multiple <SAVE> mappings
function! SetSaveKeymaps( command )
   execute "nnoremap <buffer> <leader>s ".a:command
   execute "vnoremap <buffer> <leader>s ".a:command
   execute "noremap  <buffer> <C-s>     ".a:command
   execute "inoremap <buffer> <C-s>     ".a:command
endfunction

" indirectly save the buffer with <leader>s so autocmds handle how to save
function! SaveBuffer()
   execute "normal".g:mapleader."s"
endfunction

augroup keymap_files
   autocmd!
   " save keymaps on empty buffer and no file(s) specified or pipe from stdin
   " (needed because BufNew is never called)
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter *
      \  if !argc() && !exists("s:std_in") |
      \     let s:buf=bufnr(@%) | buffer 1 |
      \     call SetSaveKeymaps('<C-c>:call ConfirmSave()<cr>') |
      \     execute "buffer".s:buf |
      \  endif
   " save keymaps for 'new' buffer with empty name
   autocmd BufNew *
      \  echo 'new file' |
      \  if empty(expand('<afile>')) |
      \     call SetSaveKeymaps('<C-c>:call ConfirmSave()<cr>') |
      \  endif
   " save keymaps for valid buffer, or after naming empty buffer
   autocmd BufReadPre,BufWritePre * call SetSaveKeymaps('<C-c>:update<cr>')
augroup END

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
