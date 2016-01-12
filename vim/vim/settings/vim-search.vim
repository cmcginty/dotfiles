set hlsearch      " highlight searches
set ignorecase    " case insensitive searches ... but
set smartcase     " ... sensitive when caps in search string
set gdefault      " always use /g for %s/foo/bar/

" clear the highlighting of :set hlsearch
"  (remapped from vim-sensible/sensible.vim)
nnoremap <silent> <space> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

