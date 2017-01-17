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
Plug 'gorodinskiy/vim-coloresque'   " colorize RGB strings
Plug 'guns/xterm-color-table.vim'   " open a color palette
Plug 'luochen1990/rainbow'          " colorize parens

" color schemes
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'zanglg/nova.vim'
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'mkarmona/colorsbox'
" Plug 'morhetz/gruvbox'
" Plug 'notpratheek/vim-luna'
" Plug 'tomasr/molokai'
" Plug 'w0ng/vim-hybrid'

" extensions
Plug 'christoomey/vim-sort-motion'  " sorting w/ motion commands
Plug 'ervandew/matchem'             " automatically close quotes, etc.
Plug 'godlygeek/tabular'            " auto-format ascii tables
Plug 'michaeljsmith/vim-indent-object' " select indent blocks
Plug 'svermeulen/vim-easyclip'      " copy/paste
Plug 'tomtom/tcomment_vim'          " quick commenting
Plug 'tpope/vim-repeat'             " enhance '.' repeat cmd
Plug 'tpope/vim-sleuth'             " auto-detect indent size
Plug 'tpope/vim-surround'           " quickly change parens,brackets,quotes
Plug 'tpope/vim-unimpaired'         " bracket mappings

" project
Plug 'ctrlpvim/ctrlp.vim'           " quick file switcher
Plug 'scrooloose/nerdtree'          " THE file browser
Plug 'ervandew/supertab'            " TAB completion (C-n/C-p)
Plug 'Chiel92/vim-autoformat'       " code formatting
Plug 'majutsushi/tagbar'            " code outline view

" git
Plug 'tpope/vim-fugitive'           " git support
Plug 'airblade/vim-gitgutter'       " highlight git diffs

" file types
" --- Multiple
Plug 'sheerun/vim-polyglot'            " multiple language packs

" --- Python
Plug 'hynek/vim-python-pep8-indent'    " python pep8 auto-indent
Plug 'kh3phr3n/python-syntax'          " better python syntax
Plug 'tmhedberg/SimpylFold'            " improves python folding

" --- Gradle/Groovy
Plug 'tfnico/vim-gradle'               " gradle build tool
Plug 'vim-scripts/groovyindent-unix'   " groovy indents syntax

" --- Git Config
Plug 'tpope/vim-git'                   " git config files

" devicons must load after other plugins it updates
Plug 'ryanoasis/vim-devicons'       " icon'd fonts

call plug#end()
