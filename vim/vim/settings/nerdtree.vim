augroup NERDTreeIntegration
   autocmd!
   " on startup, open NERDTree if no files are specified or pipe from stdin
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter * if !argc() && !exists("s:std_in") | NERDTree | wincmd p | endif

   " close Vim if only window open is NERDTree
   autocmd BufEnter * if winnr("$") ==? 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | quit | endif
augroup END

" keymap to show/hide NERDTree
map <leader>e :NERDTreeToggle<cr>

" make nerdtree look nice
let NERDTreeMinimalUI = 1

" set default width
let NERDTreeWinSize = 35

" disable non-ascii files from being listed
let NERDTreeIgnore=['\.pyc$', '__pycache__', '\~$']

" DevIcons settings
" -----------------

" do not add any padding after the devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" enable folder/directory glyph flag
let g:WebDevIconsUnicodeDecorateFolderNodes = 0

" enable open and close folder/directory glyph flags
let g:DevIconsEnableFoldersOpenClose = 0
