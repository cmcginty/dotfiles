let g:airline_theme = "molokai"

" WARN: guifont needs a powerline font (see vim-appearance.vim)
let g:airline_powerline_fonts = 1

" show file tabs and buffer number for quick switching
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" set alternate color for modified/unselected tabs
autocmd VimEnter *
   \ let g:airline#themes#molokai#palette.tabline = {
   \    'airline_tabmod':       ['#f8f8f8','#780000',231,88,''],
   \    'airline_tabmod_unsel': ['#dddddd','#463030',231,52,''],
   \ } |
   \ :AirlineRefresh
