" key mappings for working navigation

" fix 'j' and 'k' to work with wrapped lines
noremap j gj
noremap k gk

" left(h) prev/ right(l) next buffer
noremap  <C-h>     <C-c>:bp!<cr>
noremap! <C-h>     <C-c>:bp!<cr>
noremap  <C-l>     <C-c>:bn!<cr>
noremap! <C-l>     <C-c>:bn!<cr>

" scroll up/down 1/2 page
noremap  <C-k>    <C-u>
noremap  <C-j>    <C-d>

" jump to buffer number
noremap  <leader>1   :b1<cr>
noremap  <leader>2   :b2<cr>
noremap  <leader>3   :b3<cr>
noremap  <leader>4   :b4<cr>
noremap  <leader>5   :b5<cr>
noremap  <leader>6   :b6<cr>
noremap  <leader>7   :b7<cr>
noremap  <leader>8   :b8<cr>
noremap  <leader>9   :b9<cr>

" window motions during 'insert' mode
inoremap    <C-w>h   <C-o>:wincmd h<cr>
inoremap    <C-w>j   <C-o>:wincmd j<cr>
inoremap    <C-w>k   <C-o>:wincmd k<cr>
inoremap    <C-w>l   <C-o>:wincmd l<cr>

" gVim window navigation (like tmux)
"  window motion mappings to exactly match <C-a> tmux cmds
"  NOTE: terminal mode uses default <C-w>[hjkl] motions because tmux blocks
"        <C-a> key
if has("gui_running")
   map  <C-a>h   <C-w>h
   map  <C-a>j   <C-w>j
   map  <C-a>k   <C-w>k
   map  <C-a>l   <C-w>l

   imap <C-a>h   <C-w>h
   imap <C-a>j   <C-w>j
   imap <C-a>k   <C-w>k
   imap <C-a>l   <C-w>l
endif

" close window split (lke tmux)
noremap     <C-w>x   <C-w>q
inoremap    <C-w>x   <C-o><C-w>q
if has("gui_running")
   map  <C-a>x   <C-w>x
   imap <C-a>x   <C-w>x
endif

" window splits (tmux <C-a>/ and <C-a>\)
" NOTE: like above for 'terminal' mode
noremap  <C-w>\      <C-c>:vnew<cr>
inoremap <C-w>\      <C-c>:vnew<cr>
noremap  <C-w>/      <C-c>:new<cr>
inoremap <C-w>/      <C-c>:new<cr>
if has("gui_running")
   map  <C-a>\       <C-w>\
   imap <C-a>\       <C-w>\

   map  <C-a>/       <C-w>/
   imap <C-a>/       <C-w>/
endif

" window split resizing (tmux <C-ARROW>)
" resize current buffer by +/- 5
nnoremap <C-left>    :vertical resize -3<cr>
nnoremap <C-down>    :resize +3<cr>
nnoremap <C-up>      :resize -3<cr>
nnoremap <C-right>   :vertical resize +3<cr>
