" comment + <motion> (e.g. toggle line with <leader>d_)
nmap     <leader>d         <plug>TComment_gc
vmap     <leader>d         <plug>TComment_gc

" toggle line or paragraph
nnoremap <leader>dd        :TComment<cr>
nmap <leader>dp            <plug>TComment_<c-_>p

" toggle right of cursor
nnoremap <leader>dr        :TCommentRight<cr>

" block toggle line
nmap <leader>db            <plug>TComment_Commentb
vnoremap <leader>b         :TCommentBlock<cr>
