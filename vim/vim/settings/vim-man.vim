" enable the man-pager plugin that adds ANSII color escape code support in
" Gvim/MacVim
"

runtime ftplugin/man.vim
if has("gui_running")
	nnoremap K :<C-U>exe "Man" v:count "<C-R><C-W>"<CR>
endif
