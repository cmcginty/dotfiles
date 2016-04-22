" manage Vim plugins
call plug#begin('~/.vim/plugged')

" settings/core
Plug 'tpope/vim-sensible'           " Vim defaults
Plug 'tpope/vim-eunuch'             " UNIX file commands
Plug 'qpkorr/vim-bufkill'           " kill buffers w/o breaking split windows

" appearance
Plug 'Yggdroot/indentLine'          " show indent guidelines
Plug 'vim-airline/vim-airline'         " status bars / UI
Plug 'vim-airline/vim-airline-themes'  " airline color schemes
Plug 'chriskempson/base16-vim'      " color schemes
Plug 'guns/xterm-color-table.vim'   " open a color palette
Plug 'luochen1990/rainbow'          " colorize parens

" extensions
Plug 'ervandew/matchem'             " automatically close quotes, etc.
Plug 'christoomey/vim-sort-motion'  " sorting w/ motion commands
Plug 'tomtom/tcomment_vim'          " quick commenting
Plug 'tpope/vim-repeat'             " enhance '.' repeat cmd
Plug 'tpope/vim-sleuth'             " auto-detect indent size
Plug 'tpope/vim-surround'           " quickly change parens,brackets,quotes
Plug 'tpope/vim-unimpaired'         " bracket mappings
Plug 'svermeulen/vim-easyclip'      " copy/paste

" project
Plug 'ctrlpvim/ctrlp.vim'           " quick file switcher
Plug 'scrooloose/nerdtree'          " THE file browser
Plug 'ervandew/supertab'            " TAB completion (C-n/C-p)
Plug 'Chiel92/vim-autoformat'       " code formatting

" git
Plug 'tpope/vim-fugitive'           " git support
Plug 'airblade/vim-gitgutter'       " highlight git diffs

" file types
Plug 'sheerun/vim-polyglot'            " multiple language packs
Plug 'tfnico/vim-gradle'               " gradle build tool
Plug 'tpope/vim-git'                   " git config files
Plug 'vim-scripts/groovyindent-unix'   " groovy indents syntax

" devicons must load after other plugins it updates
Plug 'ryanoasis/vim-devicons'       " icon'd fonts

call plug#end()
