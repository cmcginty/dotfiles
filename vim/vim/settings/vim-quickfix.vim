" setup the quickfix window display and key maps

augroup Quickfix
   autocmd! BufReadPost quickfix  setlocal wrap nonumber nobuflisted
augroup END

" toggle the quickfix window
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 8
    let g:qfix_win = bufnr("$")
  endif
endfunction

nnoremap <silent><C-q>   :call QFixToggle(0)<CR>
