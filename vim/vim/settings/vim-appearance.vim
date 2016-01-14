" gVim needs a powerline font
set guifont=Ubuntu\ Mono\ \derivative\ Powerline\ 12

set cursorline       " highlight current line
set number           " show line numbers on left hand side
set numberwidth=5    " set the size of the number column
set showmode         " display mode

" output
set lazyredraw    " do not update screen during macros

" disable cursor blink in command mode, set insert blink rate
set guicursor+=n-v-c:blinkon0
set guicursor+=i-ci:ver25-Cursor/lCursor-blinkwait750-blinkoff250-blinkon750

" folding
set foldlevel=1   " do not hide first level of folds

" window splits
set splitbelow    " new split on bottom
set splitright    " new vplit on right

" command line
set showcmd       " display incomplete commands
