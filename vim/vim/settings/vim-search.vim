set hlsearch      " highlight searches
set ignorecase    " case insensitive searches ... but
set smartcase     " ... sensitive when caps in search string
set gdefault      " always use /g for %s/foo/bar/

" Use ripgrep over grep
if executable('rg')
   set grepprg=rg\ --color=never\ --vimgrep
endif
