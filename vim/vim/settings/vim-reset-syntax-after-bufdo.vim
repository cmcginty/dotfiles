" Enable syntax highlighting when buffers were loaded through :bufdo, which
" disables the Syntax autocmd event to speed up processing.
" Credit: http://stackoverflow.com/a/10515142/64313
augroup EnableSyntaxHighlighting
   autocmd!
   " Filetype processing does happen, so we can detect a buffer initially
   " loaded during :bufdo through a set filetype, but missing b:current_syntax.
   "
   " Also don't do this when the user explicitly turned off syntax highlighting
   " via :syntax off and if we are in the NERDTree pannel since this causes
   " devicons to add brackets "[ ]" around the icons.
   "
   " Note: Must allow nesting of autocmds so that the :syntax enable triggers
   "       the ColorScheme event. Otherwise, some highlighting groups may not be
   "       restored properly.
   "
   " Bug: 'syntax enable' breaks devicons in NerdTree, so softRefresh must be
   "      called afterwards to remove the brackets ("[ ]") from the icons.
   autocmd BufWinEnter * nested
            \ if exists('syntax_on') && !exists('b:current_syntax')
            \    && !empty(&l:filetype)
            \    && !exists('b:NERDTree') |
            \     syntax enable | call webdevicons#softRefresh() |
            \ endif

   " The above does not handle reloading via :bufdo edit!, because the
   " b:current_syntax variable is not cleared by that. During the :bufdo,
   " 'eventignore' contains "Syntax", so this can be used to detect this
   " situation when the file is re-read into the buffer. Due to the
   " 'eventignore', an immediate :syntax enable is ignored, but by clearing
   " b:current_syntax, the above handler will do this when the reloaded buffer
   " is displayed in a window again.
   autocmd BufRead *
            \ if exists('syntax_on') && exists('b:current_syntax')
            \    && !empty(&l:filetype)
            \    && index(split(&eventignore,','),'Syntax') != -1 |
            \     unlet! b:current_syntax |
            \ endif
augroup END
