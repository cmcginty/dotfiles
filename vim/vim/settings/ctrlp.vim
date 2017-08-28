" set default key/cmd mapping
let g:ctrlp_map = '<C-o>'
" close NERDTree to prevent opening in the wrong buffer
let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'

" set the local working dir
"     r = nearest repo
"     a = shorter of CWD or dir of current file
let g:ctrlp_working_path_mode = 'ra'

" ignore temp and binary files
set wildignore +=*/tmp/*,*.so,*.swp,*.zip,*.class,.DS_Store
set wildignore +=*\\tmp\\*,*.zip,*.exe

" ignore specific directories in $HOME
exec 'set wildignore+='.$HOME.'/Box/*'
exec 'set wildignore+='.$HOME.'.Trash/*'

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

" update keymapping to match <C-space> as ESC
let g:ctrlp_prompt_mappings = { 'PrtExit()' : ['<bs>', '<c-[>', '<C-Space>'] }
