augroup NERDTreeIntegration
   autocmd!
   " on startup, open NERDTree if no files are specified or pipe from stdin
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter * if !argc() && !exists("s:std_in") | NERDTree | wincmd p | endif

   " close Vim if only window open is NERDTree
   autocmd BufEnter * if winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | quit | endif
augroup END

" keymap to show/hide NERDTree
map <C-n> :NERDTreeToggle<cr>

" make nerdtree look nice
let NERDTreeMinimalUI = 1

" set default width
let NERDTreeWinSize = 22

" show some nice colors for different files
function! nerdtree#highlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

augroup NERDTreeFileTypeColors
   autocmd!
   call nerdtree#highlightFile('md',          'Blue',     'none', 'LightBlue', '#151515')
   call nerdtree#highlightFile('txt',         'Blue',     'none', 'LightBlue', '#151515')
   call nerdtree#highlightFile('jade',        'Green',    'none', 'Green',     '#151515')
   call nerdtree#highlightFile('ini',         'Yellow',   'none', 'Yellow',    '#151515')
   call nerdtree#highlightFile('yml',         'Yellow',   'none', 'Yellow',    '#151515')
   call nerdtree#highlightFile('yaml',        'Yellow',   'none', 'Yellow',    '#151515')
   call nerdtree#highlightFile('config',      'Yellow',   'none', 'Yellow',    '#151515')
   call nerdtree#highlightFile('conf',        'Yellow',   'none', 'Yellow',    '#151515')
   call nerdtree#highlightFile('json',        'Yellow',   'none', 'Yellow',    '#151515')
   call nerdtree#highlightFile('html',        'Yellow',   'none', 'Yellow',    '#151515')
   call nerdtree#highlightFile('styl',        'Cyan',     'none', 'Turquoise', '#151515')
   call nerdtree#highlightFile('css',         'Cyan',     'none', 'Turquoise', '#151515')
   call nerdtree#highlightFile('coffee',      'Red',      'none', 'Salmon',    '#151515')
   call nerdtree#highlightFile('js',          'Red',      'none', 'Salmon',    '#151515')
   call nerdtree#highlightFile('php',         'Magenta',  'none', 'Plum',      '#151515')
   call nerdtree#highlightFile('py',          'Magenta',  'none', 'Plum',      '#151515')
   call nerdtree#highlightFile('log',         'Gray',     'none', 'Tan',       '#151515')
   call nerdtree#highlightFile('ds_store',    'Gray',     'none', 'Grey27',    '#151515')
   call nerdtree#highlightFile('gitconfig',   'Gray',     'none', 'Grey27',    '#151515')
   call nerdtree#highlightFile('gitignore',   'Gray',     'none', 'Grey27',    '#151515')
   call nerdtree#highlightFile('bashrc',      'Gray',     'none', 'Grey27',    '#151515')
   call nerdtree#highlightFile('bashprofile', 'Gray',     'none', 'Grey27',    '#151515')
   call nerdtree#highlightFile('zsh',         'Gray',     'none', 'Grey27',    '#151515')
augroup END

" disable non-ascii files from being listed
let NERDTreeIgnore=['\.pyc$', '__pycache__', '\~$']
