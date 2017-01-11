" spelling options
set spell         " enable spelling
set sps=best,5    " limit to 5 best suggestions

" create local dictionary of words that updates with 'zg'
set spellfile=~/.vim/spell/words.utf8.add

" regenerate spell file from source when starting Vim
exec 'silent mkspell! ' . &spellfile . '.spl'
