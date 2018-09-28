" manage Vim plugins
call plug#begin('~/.vim/plugged')

" settings/core
Plug 'tpope/vim-sensible'           " Vim defaults
Plug 'tpope/vim-eunuch'             " UNIX file commands
Plug 'qpkorr/vim-bufkill'           " kill buffers w/o breaking split windows

" appearance
Plug 'Yggdroot/indentLine'            " show indent guidelines
Plug 'vim-airline/vim-airline'        " status bars / UI
Plug 'vim-airline/vim-airline-themes' " airline color schemes
Plug 'gorodinskiy/vim-coloresque'     " colorize RGB strings
Plug 'guns/xterm-color-table.vim'     " open a color palette
Plug 'luochen1990/rainbow'            " colorize parens
Plug 'whatyouhide/vim-lengthmatters'  " colorize long lines

" color schemes
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'dikiaap/minimalist'
Plug 'dunckr/vim-monokai-soda'
Plug 'marcopaganini/termschool-vim-theme'
Plug 'mkarmona/colorsbox'
Plug 'mkarmona/materialbox'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'w0ng/vim-hybrid'
Plug 'zanglg/nova.vim'
Plug 'zcodes/vim-colors-basic'

" extensions
Plug 'christoomey/vim-sort-motion'     " sorting w/ motion commands
Plug 'godlygeek/tabular'               " auto-format ASCII tables
Plug 'michaeljsmith/vim-indent-object' " select indent blocks (Python)
Plug 'svermeulen/vim-easyclip'         " copy/paste
Plug 'tomtom/tcomment_vim'             " quick commenting
Plug 'tpope/vim-repeat'                " enhance '.' repeat cmd
Plug 'tpope/vim-sleuth'                " auto-detect indent size
Plug 'tpope/vim-surround'              " quickly change parens,brackets,quotes
Plug 'tpope/vim-unimpaired'            " bracket mappings
Plug 'tpope/vim-dispatch'              " async complier commands

" project
Plug '/usr/local/opt/fzf'           " FZF lib
Plug 'Chiel92/vim-autoformat'       " code formatting
Plug 'ervandew/supertab'            " TAB completion (C-n/C-p)
Plug 'junegunn/fzf.vim'             " FZF search commands (replace ctrlp)
Plug 'majutsushi/tagbar'            " code outline view
Plug 'scrooloose/nerdtree'          " THE file browser

" git
Plug 'tpope/vim-fugitive'           " git support
Plug 'airblade/vim-gitgutter'       " highlight git diffs

" file types
" --- Multiple
" Plug 'sheerun/vim-polyglot'            " multiple language packs
" --- Python
Plug 'davidhalter/jedi-vim'            " Python code completion
Plug 'fisadev/vim-isort'               " Module sorting
Plug 'hynek/vim-python-pep8-indent'    " Python pep8 auto-indent
Plug 'tmhedberg/SimpylFold'            " improves Python folding (very slow)
Plug 'vim-python/python-syntax'        " better Python syntax highlighting
" --- Gradle/Groovy
Plug 'tfnico/vim-gradle'               " gradle build tool
Plug 'vim-scripts/groovyindent-unix'   " groovy indents syntax
" --- Git Config
Plug 'tpope/vim-git'                   " git config files
" -- Markdown
Plug 'plasticboy/vim-markdown'         " markdown support (REQUIRES VIM-TABULAR)
" -- Golang
Plug 'fatih/vim-go',{'do': ':GoInstallBinaries'} " Go programming lang

" devicons must load after other plugins it updates
Plug 'ryanoasis/vim-devicons'       " icon'd fonts

call plug#end()
