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
" NOTE: the following key combos can not be modified in Vim
"
"    C-; : can not be captured
"    C-[ : same as ESC
"    C-i : same mapping as TAB key
"    C-m : same mapping as ENTER key

" map space to leader (does not break showcmd)
map <space>    <leader>

" enter command mode faster
nnoremap  <leader><space>  :
vnoremap  <leader><space>  :

" fix missed <ESC>
noremap  <F1> <ESC>
noremap! <F1> <ESC>

" <esc> alternatives that are faster
inoremap kj          <ESC>
inoremap <C-space>   <ESC>
vnoremap <C-space>   <ESC>
cnoremap <C-space>   <C-c>
" When in terminal, <C-space> gets interpreted as <C-@>
imap     <C-@>       <C-space>
vmap     <C-@>       <C-space>
cmap     <C-@>       <C-space>

" quickly reload the vimrc file
nnoremap <silent> <leader>` :so $MYVIMRC<cr>

" set make: command shortcut to run 'makeprg' file-type command
nnoremap <silent> <leader>m :make<cr>

" disable ex mode (you probably don't use this)
nnoremap Q <nop>
