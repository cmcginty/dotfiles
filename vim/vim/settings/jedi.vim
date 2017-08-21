" set Jedi to run in Python 3 mode
" WARN: Make sure Vim has python3 support enabled
"       (brew reinstall macvim --with-python3 --with-override-system-vim)
let g:jedi#force_py_version = 3

" disable auto-popup on dot
let g:jedi#popup_on_dot = 0

" show the method signatures w/ docs in command bar
let g:jedi#show_call_signatures = "2"

" Modify default command mappings (use <C-t> to return from jumps)
let g:jedi#documentation_command    = "K"
let g:jedi#goto_assignments_command = "<leader>j"     " (jump to define)
let g:jedi#goto_command             = "<C-]>"
let g:jedi#rename_command           = "<leader>r"     " (rename)
let g:jedi#usages_command           = "<leader>w"     " (where is)

" Unset commands
let g:jedi#goto_definitions_command = ""  " DEPRECATED
let g:jedi#completions_command      = ""  " Implemented with SuperTab <TAB>
