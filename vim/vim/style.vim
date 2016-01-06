set lbr              " if wrapping, only break on whitespace
set nowrap           " do not wrap text
set smartindent      " fully indent multi-line comments

set expandtab        " use spaces instead of tabs
set shiftwidth=3     " set 'shift' size
set softtabstop=3    " set 'tab' size during indent mode
set tabstop=3        " set tab character size

" highlight lines longer than NN characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.*/
