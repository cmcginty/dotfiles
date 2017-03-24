" extended functions for handling buffers

function! ConfirmSave()
   if &modified && confirm('Save changes to "Untitled"?',"&Yes\n&No",1) ==? 1
      browse update
   endif
endfunction

" close the current buffer with killbuf plugin (BD) or bd
function! KillBuffer()
   if &modified | call FileSaveExe() | endif
   let number_of_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
   if number_of_buffers > 1 | execute "BD!" | else | bdelete! | endif
endfunction
