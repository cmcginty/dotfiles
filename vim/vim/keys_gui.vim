" Keyboard Shortcuts
"  'nnoremap' for command mode only
"  'inoremap' for insert mode only
"  'vnoremap' for visual mode only
"  * Do NOT put comments after 'map' commands
"  * The folllow key combos can not be modified in VIM
"     C-i - same mapping as TAB key
"     C-m - same mapping as ENTER key
"
if has("gui_running")
   " save file ('save as' on new)
   nnoremap <C-s>      :if expand("%") == ""<cr>:browse confirm saveas<cr>:else<cr>:update<cr>:endif<cr><cr>
   inoremap <C-s> <C-C>:if expand("%") == ""<cr>:browse confirm saveas<cr>:else<cr>:update<cr>:endif<cr><cr>

   " save file as ...
   nnoremap <C-A-s> :browse w<cr>
   inoremap <C-A-s> <C-C>:browse w<cr>
   vnoremap <C-A-s> <C-C>:browse w<cr>

   " close tab/file (confirm)
   nnoremap <C-w>      :confirm bd<cr>
   vnoremap <C-w> <C-C>:confirm bd<cr>
   inoremap <C-w> <C-C>:confirm bd<cr>

   " close all tabs/quit (confirm)
   nnoremap <C-q>      :confirm qa<cr>
   vnoremap <C-q> <C-C>:confirm qa<cr>
   inoremap <C-q> <C-C>:confirm qa<cr>

   " find & replace
   nnoremap <C-r> :promptrep <C-R><C-W><cr>
   inoremap <C-r> <C-O>:promptrep <C-R><C-W><cr>
   vnoremap <C-r> y:promptrep <C-R>=escape(@", '\\/.*$^~[]')<cr><cr>
endif
