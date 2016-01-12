" manage vim plugins
call plug#begin('~/.vim/plugged')

" settings/core
Plug 'tpope/vim-sensible'           " vim defaults
Plug 'tpope/vim-eunuch'             " unix file commands

" appearance
Plug 'bling/vim-airline'            " status bars / UI
Plug 'chriskempson/base16-vim'      " color schemes

" extensions
Plug 'christoomey/vim-sort-motion'  " sorting w/ motion commands
Plug 'tomtom/tcomment_vim'          " quick commenting

" project
Plug 'ctrlpvim/ctrlp.vim'           " quick file switcher

call plug#end()
