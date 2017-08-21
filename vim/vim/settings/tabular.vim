" add tabular extension to bar ('|') character to perform auto alignment
" credit: https://gist.github.com/tpope/287147

inoremap <silent><bar>   <bar><esc>:call <sid>align()<cr>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" ignore <leader>a
nmap <Leader>a    <NOP>
vmap <Leader>a    <NOP>

" tables
nmap <Leader>a\|  :Tabularize /\|<CR>
vmap <Leader>a\|  :Tabularize /\|<CR>

" var lists
nmap <Leader>a=   :Tabularize /=<CR>
vmap <Leader>a=   :Tabularize /=<CR>

" python dicts (don't move :)
nmap <Leader>a:   :Tabularize /:\zs<CR>
vmap <Leader>a:   :Tabularize /:\zs<CR>

" vimscript comments
nmap <Leader>a"   :Tabularize /"<CR>
vmap <Leader>a"   :Tabularize /"<CR>

" python comments (leading two spaces)
nmap <Leader>a#   :Tabularize /\s#<CR>
vmap <Leader>a#   :Tabularize /\s#<CR>
