" copy to system clipboard
nmap <C-c> <plug>YankLinePreserveCursorPosition
vmap <C-c> <plug>VisualModeYank

" paste from system clipboard
nmap <C-v> <plug>EasyClipPasteAfter
imap <C-v> <plug>EasyClipInsertModePaste
cmap <C-v> <plug>EasyClipCommandModePaste

" clipboard settings:
"   'unnamed'
"        When set, system text copied with 'CTRL-C' or 'selected text'is
"        pasted in VIM  using 'middle-click'. Vim text copied with 'CTRL-C' or
"        'selected text' is pasted in the system using 'middle-click'.
"
"   'unnamedplus'
"        When set, system text copied with 'CTRL-C' is pasted in Vim using
"        'CTRL-V' and system 'selected text' is pasted in Vim using
"        'middle-click'. Vim text copied with 'CTRL-C' is pasted in the system
"        using 'CTRL-V' or and 'selected text' in Vim is pasted in the system
"        using 'middle-click'.
set clipboard=unnamedplus

" move cursor to end of paste
let g:EasyClipAlwaysMoveCursorToEndOfPaste=1

" share copies across instances
let g:EasyClipShareYanks=1
