" DelimitMate uses:
"     <S-Tab>  to exit current bracket
"     <C-G>g   to exit all brackets
"
" <S-Tab> is already mapped by SuperTab, use an alternate
imap <C-CR> <Plug>delimitMateS-Tab

" enable extra features
" --------------------------
" add matching right-hand space inside of empty pair
let g:delimitMate_expand_space = 1

" <CR> key indents next line and de-dents closing pair on sepeate newline
let g:delimitMate_expand_cr = 1

" correctly jump past closing brace on the next line, instead of duplicating
let g:delimitMate_jump_expansion = 1

" prevent closing pair when right-side match already exists
let g:delimitMate_balance_matchpairs = 1
