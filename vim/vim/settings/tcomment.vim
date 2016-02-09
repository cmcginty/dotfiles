" enable quick comment toggles
"
" comment + <motion> (e.g. toggle line with <leader>t_)
map <leader>t     <plug>TComment_gc

" toggle comment
nmap <leader>tt   <plug>TComment_gcc

" alternate block comment format
map <leader>tb    :TCommentBlock<CR>
