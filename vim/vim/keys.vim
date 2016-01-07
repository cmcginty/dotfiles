" How commands are mapped into vim:
"
"     map  / noremap  :  command / visual modes
"     map! / noremap! :  command / insert mode
"     nmap / nnoremap :  command mode
"     imap / inoremap :  insert mode
"     vmap / vnoremap :  visual mode
"
"  Special command used in mappings
"
"     <C-C>    : enable command mode
"
" NOTE: the folllowing key combos can not be modified in VIM
"
"    C-i : same mapping as TAB key
"    C-m : same mapping as ENTER key
"    C-n : breaks superTab plugin

" change the <leader> from \ to ,
let mapleader = ","

" fix missed <ESC>, but <Ctrl-[> is better
inoremap ` <ESC>

" quickly reload the vimrc file
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" disable command history popup
nnoremap q: :q
