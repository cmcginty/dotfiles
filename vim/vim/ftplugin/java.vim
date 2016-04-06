" JAVA filetype configuration

" set compiler, build java classes, open quikcfix window
"map <silent><F4> :w<cr>:compiler gradlew<cr>:make classes<cr>:cw 4<cr>

" increase max line length
set textwidth=100
set colorcolumn=100

" use autocmd in event syntax is toggled after the buffer loads
augroup JavaSyntaxHighlighting
   autocmd!
   autocmd BufWinEnter *.java match OverLength /\%101v.*/

   " highlight operators like +, -, =, >, <, etc ...
   autocmd BufWinEnter *.java syntax match symOperator '\v/(/|*)@!' " slash, except if followed by slash or star
   autocmd BufWinEnter *.java syntax match symOperator '\v\!'
   autocmd BufWinEnter *.java syntax match symOperator '\v\%'
   autocmd BufWinEnter *.java syntax match symOperator '\v\&'
   autocmd BufWinEnter *.java syntax match symOperator '\v\*'
   autocmd BufWinEnter *.java syntax match symOperator '\v\+'
   autocmd BufWinEnter *.java syntax match symOperator '\v\,'
   autocmd BufWinEnter *.java syntax match symOperator '\v\-'
   autocmd BufWinEnter *.java syntax match symOperator '\v\.'
   autocmd BufWinEnter *.java syntax match symOperator '\v\:'
   autocmd BufWinEnter *.java syntax match symOperator '\v\;'
   autocmd BufWinEnter *.java syntax match symOperator '\v\<'
   autocmd BufWinEnter *.java syntax match symOperator '\v\='
   autocmd BufWinEnter *.java syntax match symOperator '\v\>'
   autocmd BufWinEnter *.java syntax match symOperator '\v\?'
   autocmd BufWinEnter *.java syntax match symOperator '\v\{'
   autocmd BufWinEnter *.java syntax match symOperator '\v\|'
   autocmd BufWinEnter *.java syntax match symOperator '\v\}'
   autocmd BufWinEnter *.java syntax match symOperator '\v\~'
augroup END
