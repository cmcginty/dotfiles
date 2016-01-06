" run local setup before anything else
for f in split(glob('~/.vim.before/*.vim'), '\n')
   exe 'source' f
endfor
