"key mappings for editing

"select all
nnoremap <leader>a   ggVG
vnoremap <leader>a   <C-C>ggVG
inoremap <leader>a   <C-O>gg<C-O>VG

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

"remove highlights after find
noremap  <silent><space> :noh<bar>:echo ""<cr>

" search/replace visual selection with confirmation
vnoremap <C-r> ""y:%s/<C-r>=escape(@", '\\/.*$^~[]')<cr>//c<left><left>

"toggle spelling
nnoremap <silent><F7> :setlocal spell!<cr>
vnoremap <silent><F7> <C-C>:setlocal spell!<cr>gv
inoremap <silent><F7> <C-O>:setlocal spell!<cr>

"toggle folding
nnoremap <silent>f za
nnoremap <silent>F zA
vnoremap <silent>f zf
