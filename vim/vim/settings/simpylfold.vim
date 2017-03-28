" Configure settings for Python folding plugin
" WARN: Plugin is disabled !!

" Show a trailing docstring comment in the fold line
let g:SimpylFold_docstring_preview = 1

" Allow docstring to be folded separately (default=1)
let g:SimpylFold_fold_docstring = 1

" Allow imports to be folded
let g:SimpylFold_fold_import = 1

" fix plugin loading for some edge cases
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
