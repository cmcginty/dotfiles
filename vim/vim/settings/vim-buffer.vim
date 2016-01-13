" exit Vim when if last buffer is closed
" WARN: NERDTree breaks if buffers not closed with bufkill plugin
function! KillBufferOrExit()
   " never close a nerd tree
   if NERDTreeInFocus() | return | endif

  " bufkill extra windows, or quit
   let number_of_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
   if number_of_buffers > 1 | BD
   else | confirm qa | endif
endfunction

function! PreviousBuffer()
   if NERDTreeInFocus() | return | else | bp! | endif
endfunction

function! NextBuffer()
   if NERDTreeInFocus() | return | else | bn! | endif
endfunction
