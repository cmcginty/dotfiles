" set default key/cmd mapping
let g:ctrlp_map = '<C-o>'
let g:ctrlp_cmd = 'CtrlP'

" set the local working dir
"     r = nearest repo
"     a = shorter of CWD or dir of current file
let g:ctrlp_working_path_mode = 'ra'

" ignore temp and binary files
set wildignore +=*/tmp/*,*.so,*.swp,*.zip,*.class
set wildignore +=*\\tmp\\*,*.zip,*.exe

" ignore gitignore files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" typing delay in miliseconds before update
let g:ctrlp_lazy_update = 100

" set windows position, list order, size, and limit results
let g:ctrlp_match_window = 'top,order:ttb,min:15,max:15,results:15'

" enable regexp search
let g:ctrlp_regexp = 1

" include .* files and dirs
let g:ctrlp_show_hidden = 1

" open file in current window
let g:ctrlp_open_new_file = 'r'

" open file in current window
let g:ctrlp_open_multiple_files = '1r'

" limit total files to search; increase for large projects
let g:ctrlp_max_files = 10000
