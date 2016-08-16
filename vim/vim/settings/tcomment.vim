" enable quick comment toggles
"
" comment + <motion> (e.g. toggle line with <leader>t_)
map <leader>t        <plug>TComment_gc
" toggle line or paragraph
nmap <leader>tt      :TComment<cr>
nmap <leader>tp      <leader>_p
" block toggle line
nmap <leader>tb      :TCommentBlock<cr>

" visual toggle comment
vmap <leader>b       :TCommentBlock<cr>
