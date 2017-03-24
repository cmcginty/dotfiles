" show some nice colors for different files

" Base16 GUI color definitions
let s:gui00 = "181818"  "black
let s:gui01 = "282828"  "darkgrey
let s:gui02 = "383838"  "darkgrey
let s:gui03 = "585858"  "grey
let s:gui04 = "b8b8b8"  "grey
let s:gui05 = "d8d8d8"  "grey
let s:gui06 = "e8e8e8"  "lightgrey
let s:gui07 = "f8f8f8"  "white
let s:gui08 = "ab4642"  "red
let s:gui09 = "dc9656"  "orange
let s:gui0A = "f7ca88"  "yellow
let s:gui0B = "a1b56c"  "green
let s:gui0C = "86c1b9"  "cyan
let s:gui0D = "7cafc2"  "blue
let s:gui0E = "ba8baf"  "magenta
let s:gui0F = "a16946"  "brown

" Terminal color definitions
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace ==? "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "10"
  let s:cterm02 = "11"
  let s:cterm04 = "12"
  let s:cterm06 = "13"
  let s:cterm09 = "09"
  let s:cterm0F = "14"
endif

" built-in types
exec "highlight NERDTreeDir         ctermfg=". s:cterm0D ." ctermbg=NONE guifg=#". s:gui0D ." guibg=NONE"
exec "highlight NERDTreeOpenable    ctermfg=". s:cterm0D ." ctermbg=NONE guifg=#". s:gui0D ." guibg=NONE"
exec "highlight NERDTreeClosable    ctermfg=". s:cterm08 ." ctermbg=NONE guifg=#". s:gui08 ." guibg=NONE"

" custom file types
exec "highlight FileSourceJs        ctermfg=". s:cterm0B ." ctermbg=NONE guifg=#". s:gui0B ." guibg=NONE"
exec "highlight FileSourcePhp       ctermfg=". s:cterm0B ." ctermbg=NONE guifg=#". s:gui0B ." guibg=NONE"
exec "highlight FileSourcePython    ctermfg=". s:cterm0B ." ctermbg=NONE guifg=#". s:gui0B ." guibg=NONE"
exec "highlight FileMarkup          ctermfg=". s:cterm08 ." ctermbg=NONE guifg=#". s:gui08 ." guibg=NONE"
exec "highlight FileStyle           ctermfg=". s:cterm0C ." ctermbg=NONE guifg=#". s:gui0C ." guibg=NONE"
exec "highlight FileDocument        ctermfg=". s:cterm0A ." ctermbg=NONE guifg=#". s:gui0A ." guibg=NONE"
exec "highlight FileConfig          ctermfg=". s:cterm0E ." ctermbg=NONE guifg=#". s:gui0E ." guibg=NONE"
exec "highlight FileLogging         ctermfg=". s:cterm04 ." ctermbg=NONE guifg=#". s:gui04 ." guibg=NONE"
exec "highlight FileIgnore          ctermfg=". s:cterm03 ." ctermbg=NONE guifg=#". s:gui03 ." guibg=NONE"


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
