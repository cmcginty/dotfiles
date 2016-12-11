augroup NERDTreeIntegration
   autocmd!
   " on startup, open NERDTree if no files are specified or pipe from stdin
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter * if !argc() && !exists("s:std_in") | NERDTree | wincmd p | endif

   " close Vim if only window open is NERDTree
   autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
   call nerdtree#highlightFile('jade',        'green',    'none', 'green',     '#151515')
   call nerdtree#highlightFile('ini',         'yellow',   'none', 'yellow',    '#151515')
   call nerdtree#highlightFile('md',          'blue',     'none', '#3366FF',   '#151515')
   call nerdtree#highlightFile('yml',         'yellow',   'none', 'yellow',    '#151515')
   call nerdtree#highlightFile('config',      'yellow',   'none', 'yellow',    '#151515')
   call nerdtree#highlightFile('conf',        'yellow',   'none', 'yellow',    '#151515')
   call nerdtree#highlightFile('json',        'yellow',   'none', 'yellow',    '#151515')
   call nerdtree#highlightFile('html',        'yellow',   'none', 'yellow',    '#151515')
   call nerdtree#highlightFile('styl',        'cyan',     'none', 'cyan',      '#151515')
   call nerdtree#highlightFile('css',         'cyan',     'none', 'cyan',      '#151515')
   call nerdtree#highlightFile('coffee',      'Red',      'none', 'red',       '#151515')
   call nerdtree#highlightFile('js',          'Red',      'none', '#ffa500',   '#151515')
   call nerdtree#highlightFile('php',         'Magenta',  'none', '#ff00ff',   '#151515')
   call nerdtree#highlightFile('ds_store',    'Gray',     'none', '#686868',   '#151515')
   call nerdtree#highlightFile('gitconfig',   'Gray',     'none', '#686868',   '#151515')
   call nerdtree#highlightFile('gitignore',   'Gray',     'none', '#686868',   '#151515')
   call nerdtree#highlightFile('bashrc',      'Gray',     'none', '#686868',   '#151515')
   call nerdtree#highlightFile('bashprofile', 'Gray',     'none', '#686868',   '#151515')
augroup END
