" extended functions for handling buffers

" register a buffer name that return 0 when 'IsFileBuffer' called
let s:BufferIgnoreList = []
function! AddIgnoredBuffer(filename)
   call add(s:BufferIgnoreList,a:filename)
endfunction

" check buffer contains a real file and not a plugin viewport of some type
function! IsFileBuffer()
   let fname = expand('%')
   " hidden buffers (help, NERDTree) are not files
   if !buflisted(bufnr('%')) | return 0 | endif
   " static buffers are not files
   if !&modifiable | return 0 | endif
   " unamed buffers, are new files
   if fname == "" | return 1 | endif
   " unreadable buffers are not files
   if !filereadable(fname) | return 0 | endif
   return 1
endfunction

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
"     c) handles edge case when last open buffer is closed
" WARN: NERDTree breaks if buffers not closed with bufkill plugin
function! KillBuffer()
   "if FugitiveDiffInFocus() | quit | return | endif
   if !IsFileBuffer() | quit | return | endif
   let number_of_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
   try
      if &modified | call SaveBuffer() | endif
      if number_of_buffers > 1
         BD!
      else
         " BD (killbuf) on last buffer breaks Airline
         bdelete
      endif
   endtry
endfunction

function! PreviousBuffer()
   " if buffer is some type of non-file view, do not modify
   if !IsFileBuffer() | return | endif
   " cycle until next file buffer is found
   bp!
   while !IsFileBuffer() | bp! | endwhile
endfunction

function! NextBuffer()
   " if buffer is some type of non-file view, do not modify
   if !IsFileBuffer() | return | endif
   " cycle until next file buffer is found
   bn!
   while !IsFileBuffer() | bn! | endwhile
endfunction
