" gVim needs a powerline font
if has("gui_macvim")
   set guifont=Ubuntu\ Mono\ Nerd\ Font\ Complete\ Mono:h14
else
   set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
endif

set nocursorline     " do not highlight current line (navigation is very slow when enabled)
set number           " show line numbers on left hand side
set numberwidth=5    " set the size of the number column
set showmode         " display mode

" output
set lazyredraw    " do not update screen during macros

" disable cursor blink in command mode, set insert blink rate
set guicursor+=n-v-c:blinkon0
set guicursor+=i-ci:ver25-Cursor/lCursor-blinkwait750-blinkoff250-blinkon750

" folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds
set foldnestmax=10      " 10 nested fold max

" window splits
set splitbelow    " new split on bottom
set splitright    " new vsplit on right

" command line
set showcmd       " display incomplete commands
set wildmenu      " visual autocomplete for command menu
