set lbr              " if wrapping, only break on whitespace
set nowrap           " do not wrap text
set smartindent      " fully indent multi-line comments

set expandtab        " use spaces instead of tabs
set shiftwidth=3     " set 'shift' size
set softtabstop=3    " set 'tab' size during indent mode
set tabstop=3        " set tab character size

set textwidth=80
set colorcolumn=80

" use autocmd in event syntax is toggled after the buffer loads
augroup DefaultSyntaxHighlighting
   autocmd!
   " highlight lines longer than 90 characters
   autocmd BufWinEnter * highlight OverLength guibg=#341818
   autocmd BufWinEnter * match OverLength /\%91v.*/

   " extended syntax highlighting
   " java 'new', 'instanceof'
   autocmd BufWinEnter * highlight Operator ctermfg=5  guifg=#d175bc
   " java 'this', 'super'
   autocmd BufWinEnter * highlight Typedef  ctermfg=5  guifg=#d175bc
   " java 'void', 'int', 'double'
   autocmd BufWinEnter * highlight Type     ctermfg=4  guifg=#7cafc2
   " literal numbers
   autocmd BufWinEnter * highlight Number term=bold ctermfg=16 gui=bold guifg=#d2d22d
   " extended symbol operators (e.g. + - = < > ! * /)
   " NOTE: supported operators are customized in local ftplugin/* files
   autocmd BufWinEnter * highlight SymOperator ctermfg=13  guifg=#86c1b9
augroup END
