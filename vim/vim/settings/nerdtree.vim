" on startup, open NERDTree w/ files, goto (last window)
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" on startup, open NERDTree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close Vim if only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" keymap to show/hide NERDTree
map <C-n> :NERDTreeToggle<cr>

" Make nerdtree look nice
let NERDTreeMinimalUI = 1

" helper function to detect NERDTree window
function! NERDTreeInFocus()
   if matchstr(expand("%"), 'NERD') == 'NERD'
      return 1
   else
      return 0
endfunction
