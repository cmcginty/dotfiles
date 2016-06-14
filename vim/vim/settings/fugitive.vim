" options and key mappings for Git Fugitive plugin
"
" diff options (use dp and do builtins)
set diffopt=filler,vertical

" toggle the GStatus window
function! fugitive#toggleStatus()
   if bufloaded(bufname('.git/index')) " true when visible
      execute "bdelete".bufnr('.git/index')
   else
      Gstatus
   endif
endfunction

" some mappings 'g' mappings are used by Vim and should not be remapped:
"
"  g]                ctag jump
"  gc<motion>        comment text
"  gg                go to top
"  gq<text obj>      format text

" only avaiable when 'Fugitive' plugin detects a repo
augroup FugitiveKeyMapping
   autocmd!
   autocmd User Fugitive noremap <buffer> <C-g>          :call fugitive#toggleStatus()<cr>
   autocmd User Fugitive noremap <buffer> <leader>gb     :Gblame<cr>
   autocmd User Fugitive noremap <buffer> <leader>ga     :Gcommit --amend<cr>
   autocmd User Fugitive noremap <buffer> <leader>gc     :Gcommit<cr>
   autocmd User Fugitive noremap <buffer> <leader>gd     :Gdiff<cr>
   autocmd User Fugitive noremap <buffer> <leader>ge     :Gedit<cr>
   autocmd User Fugitive noremap <buffer> <leader>gp     :Glog -20 -- %<cr>
   autocmd User Fugitive noremap <buffer> <leader>gl     :Glog -20<cr>
   autocmd User Fugitive noremap <buffer> <leader>gm     :Gmove<space>
   autocmd User Fugitive noremap <buffer> <leader>gx     :Gremove<cr>
   autocmd User Fugitive noremap <buffer> <leader>gr     :Gread<cr>
   autocmd User Fugitive noremap <buffer> <leader>gw     :Gwrite<cr>

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
augroup END

" control Fugitive impacts other plugins and buffer navigation
augroup FugitiveIntegration
   autocmd!
   " do not show Fugitive buffers in Airline
   autocmd BufReadPost *.git/index   setlocal nobuflisted
   autocmd BufEnter    fugitive://*  if &diff | setlocal nobuflisted | endif

   " delete old fugitive buffers
   autocmd BufReadPost fugitive://* setlocal bufhidden=delete

   " GitStatus keymaps
   autocmd BufReadPost *.git/index  nmap <buffer> <C-d> q

   " GitEdit
   autocmd BufReadPost fugitive://* nmap <buffer> <C-s>     <C-c>:update<cr>
   autocmd BufReadPost fugitive://* nmap <buffer> <leader>s <C-c>:update<cr>
   autocmd BufReadPost fugitive://* nmap <buffer> <C-d>     <C-c>:bn!<cr>

   " GitDiff keymaps
   autocmd BufEnter    fugitive://* if &diff | nmap <buffer> <C-d> <C-c>:bd!<cr>| endif
   autocmd BufEnter    fugitive://* if &diff | nmap <buffer> <C-h> <NOP>| endif
   autocmd BufEnter    fugitive://* if &diff | nmap <buffer> <C-l> <NOP>| endif

   " Gitcommit message keymaps
   autocmd BufReadPost */COMMIT_EDITMSG nmap <buffer> <C-h> <NOP>
   autocmd BufReadPost */COMMIT_EDITMSG nmap <buffer> <C-l> <NOP>
   autocmd BufReadPost */COMMIT_EDITMSG nmap <buffer> <C-d> <C-c>:wq<cr>
   autocmd BufReadPost */COMMIT_EDITMSG imap <buffer> <C-d> <C-c>:wq<cr>
augroup END
