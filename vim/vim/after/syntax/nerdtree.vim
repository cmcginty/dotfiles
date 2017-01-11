" show some nice colors for different files

syn match FileConfig          /^\s\+.*\.conf$/
syn match FileConfig          /^\s\+.*\.config$/
syn match FileConfig          /^\s\+.*\.ini$/
syn match FileConfig          /^\s\+.*\.json$/
syn match FileConfig          /^\s\+.*\.yaml$/
syn match FileConfig          /^\s\+.*\.yml$/

syn match FileDocument        /^\s\+.*\.md$/
syn match FileDocument        /^\s\+.*\.txt$/

syn match FileIgnore          /^\s\+.*\.bashrc$/
syn match FileIgnore          /^\s\+.*\.ds_store$/
syn match FileIgnore          /^\s\+.*\.gitconfig$/
syn match FileIgnore          /^\s\+.*\.gitignore$/
syn match FileIgnore          /^\s\+.*\.zsh$/

syn match FileLogging         /^\s\+.*\.log$/

syn match FileSourceJs        /^\s\+.*\.js$/
syn match FileSourcePhp       /^\s\+.*\.php$/
syn match FileSourcePython    /^\s\+.*\.py$/

syn match FileMarkup          /^\s\+.*\.html$/
syn match FileStyle           /^\s\+.*\.css$/

highlight FileSourceJs        ctermfg=DarkRed ctermbg=NONE guifg=DarkRed guibg=NONE
highlight FileSourcePhp       ctermfg=DarkMagenta ctermbg=NONE guifg=Plum guibg=NONE
highlight FileSourcePython    ctermfg=Yellow ctermbg=NONE guifg=Orange guibg=NONE

highlight FileMarkup          ctermfg=Blue ctermbg=NONE guifg=#3366ff guibg=NONE
highlight FileStyle           ctermfg=Cyan ctermbg=NONE guifg=Turquoise guibg=NONE

highlight FileDocument        ctermfg=Blue ctermbg=NONE guifg=#3366ff guibg=NONE
highlight FileConfig          ctermfg=DarkYellow ctermbg=NONE guifg=DarkYellow guibg=NONE

highlight FileLogging         ctermfg=Red ctermbg=NONE guifg=DarkRed guibg=NONE
highlight FileIgnore          ctermfg=Grey ctermbg=NONE guifg=Grey27 guibg=NONE
