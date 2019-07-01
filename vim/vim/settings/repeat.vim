" remap RepeatUndo so it doesn't clobber <C-r> by default
"
" FIXME: <Plug>(RepeatRedo) does not register by default? The fix is to directly
"        call the mapping from vim-repeat.vim
"
nnoremap <c-u>    :<C-u>call repeat#wrap("\<lt>C-R>",v:count)<cr>
