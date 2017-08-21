"key mappings for editing

"select all
nnoremap <leader>vA   ggVG
vnoremap <leader>vA   <C-C>ggVG
inoremap <leader>vA   <C-O>gg<C-O>VG

"redo
nnoremap <C-u> <C-r>

"enable tab indent/unindent (tip 224)
nnoremap <tab>    v>
vnoremap <tab>    >gv
nnoremap <S-tab>  v<
vnoremap <S-tab>  <gv

"sort selection (normal and unique)
vnoremap s        :sort<cr>
vnoremap <S-s>    :sort u<cr>

"find (word under cursor)
nnoremap <C-f> /<C-r><C-w>
inoremap <C-f> <C-o>/<C-r><C-w>

"find (highlighted text)
vnoremap <C-f> y/<C-R>=escape(@", '\\/.*$^~[]')<cr>
vnoremap *     y/<C-R>=escape(@", '\\/.*$^~[]')<cr>

"reverse find (highlighted text)
vnoremap #     y?<C-R>=escape(@", '\\/.*$^~[]')<cr>

" clear the highlighting of :set hlsearch
"  (remapped from vim-sensible/sensible.vim)
nnoremap <silent> <leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" search/replace visual selection with confirmation
vnoremap <C-r> ""y:%s/<C-r>=escape(@", '\\/.*$^~[]')<cr>//c<left><left>

"toggle spelling
nnoremap <silent> <F7>  :setlocal spell!<cr>
vnoremap <silent> <F7>  <C-C>:setlocal spell!<cr>gv
inoremap <silent> <F7>  <C-O>:setlocal spell!<cr>

"open/close folds
nnoremap <leader>z   za
"recursive open/close all folds"
nnoremap <leader>Z   zA
"create a fold over a visual range
vnoremap <leader>z   zf
