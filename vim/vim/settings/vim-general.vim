" enable/disable Vim features and major settings

" allow Vim to manage buffers in the background
set hidden

" <TAB> completion matches up to first unknown character, similar to shell
" matching
set wildmode=list:longest

" Isolate swap files to a single directory instead of spreading around local
" file-system
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Disable weird prompts like "Press ENTER or type command to continue"
set shortmess=atI

" Disable bell (sound) alerts
set belloff=esc,error

" Set default folding method (indent, manual, marker, expr, syntax, diff)
" Use the ftplugin feature to override different
set foldmethod=indent
