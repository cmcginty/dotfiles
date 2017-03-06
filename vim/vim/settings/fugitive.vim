" options and key mappings for Git Fugitive plugin
"
" diff options (use dp and do builtins)
set diffopt=filler,vertical

" custom git commands
command! Gpending  :Git! diff -M
command! Greview   :Git! diff -M --cached

" toggle the GStatus window
function! fugitive#toggleStatus()
   if bufloaded(bufname('.git/index')) " true when visible
      execute "bdelete".bufnr('.git/index')
   else
      Gstatus
      resize +20  " increase height
   endif
endfunction

" some mappings 'g' mappings are used by Vim and should not be remapped:
"
"  g]                ctag jump
"  gc<motion>        comment text
"  gg                go to top
"  gq<text obj>      format text

" only available when 'Fugitive' plugin detects a repo
augroup FugitiveKeyMapping
   autocmd!
   " open git status window at bottom of screen
   autocmd User Fugitive nnoremap <buffer> <C-g>         :call fugitive#toggleStatus()<cr>
   " open a 'blame' list next to current file
   autocmd User Fugitive nnoremap <buffer> <leader>gb    :Gblame<cr>
   autocmd User Fugitive nnoremap <buffer> <leader>ga    :Gcommit --amend<cr>
   autocmd User Fugitive nnoremap <buffer> <leader>gc    :Gcommit<cr>

   " diff of un-staged changes
   autocmd User Fugitive nnoremap <buffer> <leader>gdd   :Gpending<cr>
   " split-diff of current changes
   autocmd User Fugitive nnoremap <buffer> <leader>gds   :Gdiff<cr>
   " diff of staged changes in index
   autocmd User Fugitive nnoremap <buffer> <leader>gdc   :Greview<cr>

   autocmd User Fugitive nnoremap <buffer> <leader>ge    :Gedit<cr>
   " diff a previous version of the file
   autocmd User Fugitive nnoremap <buffer> <leader>gp    :Glog -20 -- %<cr>
   " open a previous version of file to open
   autocmd User Fugitive nnoremap <buffer> <leader>gl    :Glog -20<cr>
   autocmd User Fugitive nnoremap <buffer> <leader>gm    :Gmove<space>
   autocmd User Fugitive nnoremap <buffer> <leader>gx    :Gremove<cr>
   autocmd User Fugitive nnoremap <buffer> <leader>gr    :Gread<cr>
   " write the current file to the git-index
   autocmd User Fugitive nnoremap <buffer> <leader>gw    :Gwrite<cr>

   " open file in Github
   autocmd User Fugitive nnoremap <buffer> <leader>gh    :Gbrowse<cr>

   " 3-way diff merge conflicts
   "     diffput,dp        works as usual
   "     dt (diff target)  get the target change
   "     dm (diff merge)   get the merge change
   autocmd User Fugitive nnoremap <leader>dt   :diffget<space>//2<cr>
   autocmd User Fugitive nnoremap <leader>dm   :diffget<space>//3<cr>

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
