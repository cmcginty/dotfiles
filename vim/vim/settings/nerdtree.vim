" on startup, open NERDTree w/ files, goto (last window)
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" on startup, open NERDTree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close Vim if only window open is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" keymap to show/hide NERDTree
map <C-n> :NERDTreeToggle<cr>

" make nerdtree look nice
let NERDTreeMinimalUI = 1

" set default width
let NERDTreeWinSize = 22

" helper function to detect NERDTree window
function! NERDTreeInFocus()
   return matchstr(expand("%"), 'NERD_tree_') == 'NERD_tree_'
endfunction

" show some nice colors for different files
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade',        'green',    'none', 'green',     '#151515')
call NERDTreeHighlightFile('ini',         'yellow',   'none', 'yellow',    '#151515')
call NERDTreeHighlightFile('md',          'blue',     'none', '#3366FF',   '#151515')
call NERDTreeHighlightFile('yml',         'yellow',   'none', 'yellow',    '#151515')
call NERDTreeHighlightFile('config',      'yellow',   'none', 'yellow',    '#151515')
call NERDTreeHighlightFile('conf',        'yellow',   'none', 'yellow',    '#151515')
call NERDTreeHighlightFile('json',        'yellow',   'none', 'yellow',    '#151515')
call NERDTreeHighlightFile('html',        'yellow',   'none', 'yellow',    '#151515')
call NERDTreeHighlightFile('styl',        'cyan',     'none', 'cyan',      '#151515')
call NERDTreeHighlightFile('css',         'cyan',     'none', 'cyan',      '#151515')
call NERDTreeHighlightFile('coffee',      'Red',      'none', 'red',       '#151515')
call NERDTreeHighlightFile('js',          'Red',      'none', '#ffa500',   '#151515')
call NERDTreeHighlightFile('php',         'Magenta',  'none', '#ff00ff',   '#151515')
call NERDTreeHighlightFile('ds_store',    'Gray',     'none', '#686868',   '#151515')
call NERDTreeHighlightFile('gitconfig',   'Gray',     'none', '#686868',   '#151515')
call NERDTreeHighlightFile('gitignore',   'Gray',     'none', '#686868',   '#151515')
call NERDTreeHighlightFile('bashrc',      'Gray',     'none', '#686868',   '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray',     'none', '#686868',   '#151515')
