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
autocmd User Fugitive noremap <buffer> gww    :Gwrite<cr>
autocmd User Fugitive noremap <buffer> gbl    :Gblame<cr>
autocmd User Fugitive noremap <buffer> gcm    :Gcommit<cr>
autocmd User Fugitive noremap <buffer> gca    :Gcommit --amend<cr>
autocmd User Fugitive noremap <buffer> gd     :Gdiff<cr>
autocmd User Fugitive noremap <buffer> gmv    :Gmove<space>
autocmd User Fugitive noremap <buffer> grm    :Gremove<cr>
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

" do not show Fugitive buffers in Airline
autocmd BufReadPost *.git/index   set nobuflisted
autocmd BufEnter    fugitive://*  if &diff | set nobuflisted | endif

" toggle the GStatus window
function! fugitive#toggleStatus()
   if bufloaded(bufname('.git/index')) " true when visible
      execute "bdelete".bufnr('.git/index')
   else
      Gstatus
   endif
endfunction

" delete old fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" GitStatus keymaps
autocmd BufReadPost *.git/index  nmap <buffer> <C-d> q

" GitEdit/Diff keymaps
autocmd BufReadPost fugitive://* nmap <buffer> <C-s>     <C-c>:update<cr>
autocmd BufReadPost fugitive://* nmap <buffer> <leader>s <C-c>:update<cr>
autocmd BufReadPost fugitive://* nmap <buffer> <C-d>     <C-c>:bd!<cr>

" GitDiff keymaps
autocmd BufEnter    fugitive://* if &diff | nmap <buffer> <C-h> <NOP>| endif
autocmd BufEnter    fugitive://* if &diff | nmap <buffer> <C-l> <NOP>| endif

" Gitcommit message keymaps
autocmd BufReadPost */COMMIT_EDITMSG nmap <buffer> <C-h> <NOP>
autocmd BufReadPost */COMMIT_EDITMSG nmap <buffer> <C-l> <NOP>
autocmd BufReadPost */COMMIT_EDITMSG nmap <buffer> <C-d> <C-c>:wq<cr>
autocmd BufReadPost */COMMIT_EDITMSG imap <buffer> <C-d> <C-c>:wq<cr>
