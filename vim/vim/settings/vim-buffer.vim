" extended functions for handling buffers
"
" save the current buffer
function! SaveBuffer()
   if !empty(bufname('%'))
      update
   else " file is unnamed
      " ask to save a file with no name
      if confirm('Save changes to "Untitled"?',"&Yes\n&No",1) == 2
         return
      else
         browse update
      endif
   endif
endfunction

" advanced logic to close the current buffer
"     a) prevents NERDTree from being closed, use NERDTreeToggle
"     b) correctly handles closing a :Gdiff split window
"     c) if final buffer is being closed, Vim exits
" WARN: NERDTree breaks if buffers not closed with bufkill plugin
function! KillBufferOrExit()
   " never close a nerd tree
   if NERDTreeInFocus() | return | endif

   " cannot bufkill a fugitive diff
   if FugitiveDiffInFocus() | quit | return | endif

   " save, then bufkill or quit on last buffer
   let number_of_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
   try
      if number_of_buffers > 1
         call SaveBuffer() | BD!
      else
         call SaveBuffer() | quit!
      endif
   endtry
endfunction

function! PreviousBuffer()
   if NERDTreeInFocus() | return | endif
   if FugitiveDiffInFocus() | return | endif
   if FugitiveStatusInFocus() | return | endif
   bp!
endfunction

function! NextBuffer()
   if NERDTreeInFocus() | return | endif
   if FugitiveDiffInFocus() | return | endif
   if FugitiveStatusInFocus() | return | endif
   bn!
endfunction
