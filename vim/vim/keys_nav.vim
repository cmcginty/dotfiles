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

" gvim window navigation (like tmux)
"  window motion mappings to exactly match <C-a> tmux cmds
"  NOTE: terminal mode uses default <C-w>[hjkl] motions because tmux blocks
"        <C-a> key
if has("gui_running")
   noremap  <C-a>h        :wincmd h<cr>
   inoremap <C-a>h   <C-o>:wincmd h<cr>

   noremap  <C-a>j        :wincmd j<cr>
   inoremap <C-a>j   <C-o>:wincmd j<cr>

   noremap  <C-a>k        :wincmd k<cr>
   inoremap <C-a>k   <C-o>:wincmd k<cr>

   noremap  <C-a>l        :wincmd l<cr>
   inoremap <C-a>l   <C-o>:wincmd l<cr>

   " close the active window
   noremap  <C-a>x        :wincmd q<cr>
   inoremap <C-a>x   <C-o>:wincmd q<cr>
endif

" window splits (tmux <C-a>/ and <C-a>\)
" NOTE: like above for 'terminal' mode
nnoremap <C-w>\      <C-c>:vsplit new<cr>
nnoremap <C-w>/      <C-c>:split new<cr>
if has("gui_running")
   noremap <C-a>\    <C-c>:vsplit new<cr>
   noremap <C-a>/    <C-c>:split new<cr>
endif
