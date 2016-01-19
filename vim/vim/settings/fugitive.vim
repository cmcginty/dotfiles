" key mappings for Git Fugitive plugin
"
" some mappings 'g' mappings are used by Vim and should not be remapped:
"
"  g]                ctag jump
"  gc<motion>        comment text
"  gg                go to top
"  gq<text obj>      format text

noremap <C-g>  :call ToggleGStatus()<cr>
noremap gww    :Gwrite<cr>
noremap gbl    :Gblame<cr>
noremap gcm    :Gcommit<cr>
noremap gd     :Gdiff<cr>
noremap gmv    :Gmove<space>
noremap grm    :Gremove<cr>
noremap grr    :Gread<cr>

" 3-way diff merge conflicts
"     diffput,dp        works as usual
"     dt (diff target)  get the target change
"     dm (diff merge)   get the merge change
noremap <leader>dt   :diffget<space>//2<cr>
noremap <leader>dm   :diffget<space>//3<cr>

" diff options (use dp and do builtins)
set diffopt=filler,vertical

" helper to detect a fugitive diff buffer
function! FugitiveDiffInFocus()
   return matchstr(expand("%"), 'fugitive://') == 'fugitive://'
endfunction

" toggle the GStatus window
function! ToggleGStatus()
   if bufloaded('.git/index') " true when visible
      execute bufwinnr('.git/index') . "wincmd w"
      hide
   else
      Gstatus
      set nobuflisted   " hide Gstatus from airline tab
   endif
endfunction

" go 'back' after navigating git tree/blob
autocmd User Fugitive
   \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
   \    nnoremap <buffer> .. :edit %:h<CR> |
   \ endif

" delete old fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
