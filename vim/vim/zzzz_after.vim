" run local setup at the end
for f in split(glob('~/.vim.after/*.vim'), '\n')
   exe 'source' f
endfor
