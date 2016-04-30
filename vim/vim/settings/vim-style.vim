set lbr              " if wrapping, only break on whitespace
set nowrap           " do not wrap text
set smartindent      " fully indent multi-line comments

set expandtab        " use spaces instead of tabs
set shiftwidth=3     " set 'shift' size
set softtabstop=3    " set 'tab' size during indent mode
set tabstop=3        " set tab character size

set textwidth=80     " line length before wrapping text
set colorcolumn=80

set fileformat=unix  " default line-ending format

" default text auto-format options (:help fo-table)
" c = auto-wrap comments, insert leader
" j = remove leader joining lines
" l = do not break long lines in insert mode (ENABLE for source code)
" n = auto-indent numbered lists
" o = auto-insert comment leader after 'o' from normal mode
" q = format comments with 'gq'
" r = auto-insert comment leader after <CR>
" t = auto-wrap text (DISABLE for source code)
set formatoptions+=cjnoqrt

" create an empty highlight group (color set below)
highlight OverLength ctermbg=none
match OverLength /\%91v.*/ " highlight lines longer than 90 characters

" use autocmd to override the color scheme or when 'syntax' mode is toggled
augroup CustomColorScheme
   autocmd!
   " highlight lines longer than N characters
   autocmd VimEnter,ColorScheme * highlight OverLength guibg=#341818

   " extended syntax highlighting
   " java 'new', 'instanceof'
   autocmd VimEnter,ColorScheme * highlight Operator ctermfg=5  guifg=#d175bc
   " java 'this', 'super'
   autocmd VimEnter,ColorScheme * highlight Typedef  ctermfg=8  guifg=#ab4642
   " java 'void', 'int', 'double'
   autocmd VimEnter,ColorScheme * highlight Type     ctermfg=4  guifg=#7cafc2
   " literal numbers
   autocmd VimEnter,ColorScheme * highlight Number term=bold ctermfg=16 gui=bold guifg=#d2d22d
   " extended symbol operators (e.g. + - = < > ! * /)
   " NOTE: supported operators are customized in local syntax/* files
   autocmd VimEnter,ColorScheme * highlight ExtraOperator ctermfg=9 guifg=#dc9656
augroup END
