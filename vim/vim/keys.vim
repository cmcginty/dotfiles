" How commands are mapped into vim:
"
"     map  / noremap  :  command / visual modes
"     map! / noremap! :  command / insert mode
"     nmap / nnoremap :  command mode
"     imap / inoremap :  insert mode
"     vmap / vnoremap :  visual mode
"
"  Special command used in mappings (see also: help key-notation)
"
"     <C-c>    : go to command mode
"     <C-o>    : use command mode and return to last mode
"
" NOTE: the folllowing key combos can not be modified in VIM
"
"    C-; : can not be captured
"    C-[ : same as ESC
"    C-i : same mapping as TAB key
"    C-m : same mapping as ENTER key

" change the <leader> from \ to ,
let mapleader = ','

" enter command mode faser
nnoremap  <leader><leader>  :
vnoremap  <leader><leader>  :

" fix missed <ESC>, but <Ctrl-[> is better
noremap  `    <ESC>
noremap! `    <ESC>
noremap  <F1> <ESC>
noremap! <F1> <ESC>

" quickly reload the vimrc file
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" disable command history popup
nnoremap q: :q
