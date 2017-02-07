setlocal shiftwidth=4     " set 'shift' size
setlocal softtabstop=4    " set 'tab' size during indent mode
setlocal tabstop=4        " set tab character size

" increase max line length and match
setlocal textwidth=100
setlocal colorcolumn=100
match OverLength /\%102v.*/

" enable indent folding, but leave all fold open at start
"     Use 'f' to toggle folds open/close
setlocal foldmethod=indent
setlocal foldlevel=99

" Use :make to see syntax errors
setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
setlocal errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" allow for Sphinx '#:' comment delimiters in Python files
setlocal comments+=:#:
