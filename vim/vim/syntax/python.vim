" Undo base16-color python syntax changes
hi! link pythonRepeat               Repeat
hi! link pythonOperator             Repeat

" add python syntax highlights
hi link pythonExtraOperator         ExtraOperator
hi link pythonExtraPseudoOperator   ExtraOperator

" extra highlights
syntax match pythonExtraPseudoOperator '\v\.'
syntax match pythonExtraPseudoOperator '\v\:'
