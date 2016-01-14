" How commands are mapped into Vim:
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
" NOTE: the folllowing key combos can not be modified in Vim
"
"    C-; : can not be captured
"    C-[ : same as ESC
"    C-i : same mapping as TAB key
"    C-m : same mapping as ENTER key

" enter command mode faser
nnoremap  <leader><leader>  :
vnoremap  <leader><leader>  :

" fix missed <ESC>
noremap  `    <ESC>
noremap! `    <ESC>
noremap  <F1> <ESC>
noremap! <F1> <ESC>

" <esc> alternatives that are faster
inoremap jj          <ESC>
noremap! <C-Space>   <ESC>
vnoremap <C-Space>   <ESC>
nnoremap <C-Space>   <NOP>

" quickly reload the vimrc file
nnoremap <silent> <leader>z :so $MYVIMRC<CR>
