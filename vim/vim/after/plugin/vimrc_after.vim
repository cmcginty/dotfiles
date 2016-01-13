" run local config options
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
