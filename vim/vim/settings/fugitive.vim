" key mappings for Git Fugitive plugin
"
" some mappings 'g' mappings are used by Vim and should not be remapped:
"
"  g]                ctag jump
"  gc<motion>        comment text
"  gg                go to top
"  gq<text obj>      format text

" only avaiable when 'Fugitive' plugin detects a repo
autocmd User Fugitive noremap <buffer> <C-g>  :call fugitive#toggleStatus()<cr>
autocmd User Fugitive noremap <buffer> gww    :Gwrite<cr> |
autocmd User Fugitive noremap <buffer> gbl    :Gblame<cr> |
autocmd User Fugitive noremap <buffer> gcm    :Gcommit<cr> |
autocmd User Fugitive noremap <buffer> gd     :Gdiff<cr> |
autocmd User Fugitive noremap <buffer> gmv    :Gmove<space> |
autocmd User Fugitive noremap <buffer> grm    :Gremove<cr> |
autocmd User Fugitive noremap <buffer> grr    :Gread<cr>

" 3-way diff merge conflicts
"     diffput,dp        works as usual
"     dt (diff target)  get the target change
"     dm (diff merge)   get the merge change
autocmd User Fugitive noremap <leader>dt   :diffget<space>//2<cr>
autocmd User Fugitive noremap <leader>dm   :diffget<space>//3<cr>

" go 'back' after navigating git tree/blob
autocmd User Fugitive
   \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
   \    nnoremap <buffer> .. :edit %:h<CR> |
   \ endif

" diff options (use dp and do builtins)
set diffopt=filler,vertical

" toggle the GStatus window
function! fugitive#toggleStatus()
   if bufloaded(bufname('.git/index')) " true when visible
      execute bufwinnr('.git/index')."wincmd w"
      bdelete
   else
      Gstatus
      set nobuflisted   " hide Gstatus from airline tab
   endif
endfunction

" delete old fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
