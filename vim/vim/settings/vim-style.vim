set lbr              " if wrapping, only break on whitespace
set nowrap           " do not wrap text
set smartindent      " fully indent multi-line comments

set expandtab        " use spaces instead of tabs
set shiftwidth=3     " set 'shift' size
set softtabstop=3    " set 'tab' size during indent mode
set tabstop=3        " set tab character size

set textwidth=80
set colorcolumn=80

" highlight lines longer than 90 characters
highlight OverLength guibg=#341818
match OverLength /\%91v.*/

" extended syntax highlighting
" Java: 'new', 'instanceof'
highlight Operator ctermfg=5  guifg=#d175bc
" Java: 'this', 'super'
highlight Typedef  ctermfg=5  guifg=#d175bc
" Java: 'void', 'int', 'double'
highlight Type     ctermfg=4  guifg=#7cafc2
" literal numbers
highlight Number term=bold ctermfg=16 gui=bold guifg=#d2d22d
" extended symbol operators (e.g. + - = < > ! * /)
" NOTE: supported operators are customized in local ftplugin/* files
highlight SymOperator ctermfg=13  guifg=#86c1b9
