" key mappings for working with files (open, close, save, etc ...)
"  INFO: for consistency, these commands mirror the tmux settings

" helper to quickly change the multiple <SAVE> mappings
function! SetSaveKeymaps( command )
   execute "nnoremap <buffer> <leader>s ".a:command
   execute "vnoremap <buffer> <leader>s ".a:command
   execute "noremap  <buffer> <C-s>     ".a:command
   execute "inoremap <buffer> <C-s>     ".a:command
endfunction

" save current buffer using <leader>s autocmd
function! SaveBuffer()
   execute "normal".g:mapleader."s"
endfunction

" disable 'buffer delete' mapping for default windows
nnoremap <C-d>    <NOP>
vnoremap <C-d>    <NOP>

" autocmd make it easier to create modal keymaps for different viewports
augroup keymap_files
   autocmd!
   autocmd StdinReadPre * let s:std_in=1
   "  for empty buffer and no file(s) specified or pipe from stdin
   "  (needed because BufNew is never called)
   autocmd VimEnter *
      \  if !argc() && !exists("s:std_in") |
      \     let s:buf=bufnr(@%) | buffer 1 |
      \     call SetSaveKeymaps('<C-c>:call ConfirmSave()<cr>') |
      \     nnoremap <buffer> <C-d>    <C-c>:call KillBuffer()<cr> |
      \     vnoremap <buffer> <C-d>    <C-d>:call KIllBuffer()<cr> |
      \     execute "buffer".s:buf |
      \  endif
   "  for 'new' buffer with empty name
   autocmd BufNew *
      \  if empty(expand('<afile>')) |
      \     call SetSaveKeymaps('<C-c>:call ConfirmSave()<cr>') |
      \     nnoremap <buffer> <C-d>    <C-c>:call KillBuffer()<cr> |
      \     vnoremap <buffer> <C-d>    <C-d>:call KIllBuffer()<cr> |
      \  endif
   "  for valid buffer, or after naming empty buffer
   autocmd BufReadPre,BufWritePre *
      \ call SetSaveKeymaps('<C-c>:update<cr>') |
      \ nnoremap <buffer> <C-d>    <C-c>:call KillBuffer()<cr> |
      \ vnoremap <buffer> <C-d>    <C-d>:call KIllBuffer()<cr>
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

" close all tabs/quit (tmux kill-session)
nnoremap <leader>q   <C-c>:confirm qa<cr>
vnoremap <leader>q   <C-c>:confirm qa<cr>
