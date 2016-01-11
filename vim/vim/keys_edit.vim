" key mappings for editing

" select all
nnoremap <leader>a   ggVG
vnoremap <leader>a   <C-C>ggVG
inoremap <leader>a   <C-O>gg<C-O>VG

" redo
nnoremap <C-u> <C-r>

" enable tab indent/unindent (tip 224)
nnoremap <tab>    v>
vnoremap <tab>    >gv
nnoremap <S-tab>  v<
vnoremap <S-tab>  <gv

" sort selection (normal and unique)
vnoremap s        :sort<cr>
vnoremap <S-s>    :sort u<cr>
