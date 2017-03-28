setlocal shiftwidth=4     " set 'shift' size
setlocal softtabstop=4    " set 'tab' size during indent mode
setlocal tabstop=4        " set tab character size

" increase max line length
setlocal textwidth=100

" DEV: delay OverLength reference until Vim loads (see vim-color.vim)
au VimEnter,ColorScheme * match OverLength /\%102v.*/

" Use :make to see syntax errors
setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
setlocal errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" allow for Sphinx '#:' comment delimiters in Python files
setlocal comments+=:#:
