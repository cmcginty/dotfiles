" key mappings for working with files (open, close, save, etc ...)
"  INFO: for consistency, these commands mirror the tmux settings

" helper to quickly change the multiple <SAVE> mappings
function! FileSaveKeymaps( command )
   execute "nnoremap <buffer> <leader>s ".a:command
   execute "vnoremap <buffer> <leader>s ".a:command
   execute "noremap  <buffer> <C-s>     ".a:command
   execute "inoremap <buffer> <C-s>     ".a:command
endfunction

" save current buffer using <leader>s autocmd
function! FileSaveExe()
   execute "normal".g:mapleader."s"
endfunction

" set the close buffer keymaps
function! FileCloseKeymaps()
   nnoremap <buffer> <C-d>    <C-c>:call KillBuffer()<cr>
   vnoremap <buffer> <C-d>    <C-d>:call KillBuffer()<cr>
endfunction

" set the buffer next/previous keymaps
function! FileNextPrevKeymaps()
   noremap  <buffer> <C-h>    <C-c>:bp!<cr>
   noremap! <buffer> <C-h>    <C-c>:bp!<cr>
   noremap  <buffer> <C-l>    <C-c>:bn!<cr>
   noremap! <buffer> <C-l>    <C-c>:bn!<cr>
endfunction

" clear default file keymaps
nnoremap <C-d>    <NOP>
vnoremap <C-d>    <NOP>
noremap  <C-h>    <NOP>
noremap! <C-h>    <NOP>
noremap  <C-l>    <NOP>
noremap! <C-l>    <NOP>

" autocmd make it easier to create modal keymaps for different viewports
augroup keymap_files
   autocmd!
   autocmd StdinReadPre * let s:std_in=1
   " executed on unnamed buffer when vim started w/ no args (no file args or
   " piped data)
   autocmd VimEnter *
      \  if !argc() || exists("s:std_in") |
      \     let s:buf=bufnr(@%) | buffer 1 |
      \     call FileSaveKeymaps('<C-c>:call ConfirmSave()<cr>') |
      \     call FileCloseKeymaps() |
      \     call FileNextPrevKeymaps() |
      \     execute "buffer".s:buf |
      \  endif
   " executed on a new 'new' buffer with empty name
   autocmd BufEnter *
      \  if empty(expand('<afile>')) |
      \     call FileSaveKeymaps('<C-c>:call ConfirmSave()<cr>') |
      \     call FileCloseKeymaps() |
      \     call FileNextPrevKeymaps() |
      \  endif
   " executed on 'new' buffer created with a non-existant file name
   autocmd BufNewFile *
      \ if !exists(expand('<afile>')) |
      \    call FileSaveKeymaps('<C-c>:update<cr>') |
      \    call FileCloseKeymaps() |
      \    call FileNextPrevKeymaps()|
      \ endif
   " executed on reading a file or after writing unnamed buffer
   autocmd BufReadPre,BufWritePre *
      \ call FileSaveKeymaps('<C-c>:update<cr>') |
      \ call FileCloseKeymaps() |
      \ call FileNextPrevKeymaps()
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
