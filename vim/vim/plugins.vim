" manage Vim plugins
call plug#begin('~/.vim/plugged')

" settings/core
Plug 'tpope/vim-sensible'           " Vim defaults
Plug 'tpope/vim-eunuch'             " UNIX file commands
Plug 'qpkorr/vim-bufkill'           " kill buffers w/o breaking split windows

" appearance
Plug 'bling/vim-airline'            " status bars / UI
Plug 'chriskempson/base16-vim'      " color schemes

" extensions
Plug 'christoomey/vim-sort-motion'  " sorting w/ motion commands
Plug 'tomtom/tcomment_vim'          " quick commenting

" project
Plug 'airblade/vim-gitgutter'       " highlight git diffs
Plug 'ctrlpvim/ctrlp.vim'           " quick file switcher
Plug 'scrooloose/nerdtree'          " THE file browser
Plug 'tpope/vim-fugitive'           " git support

" file types
Plug 'tpope/vim-git'                " git config files

" devicons must load after other plugins it updates
Plug 'ryanoasis/vim-devicons'       " icon'd fonts

call plug#end()
