" spelling options
set spell         " enable spelling
set sps=fast,3    " WARN: "best" can be really slow

" create local dictionary of words that updates with 'zg'
set spellfile=~/.vim/spell/words.utf8.add

" regenerate spell file from source when starting Vim
exec 'silent mkspell! ' . &spellfile
