" highlight operators like +, -, =, >, <, etc ...
syntax match javaExtraOperator '\v/(/|*)@!' " slash, except if followed by slash or star
syntax match javaExtraOperator '\v\!'
syntax match javaExtraOperator '\v\%'
syntax match javaExtraOperator '\v\&'
syntax match javaExtraOperator '\v\*'
syntax match javaExtraOperator '\v\+'
syntax match javaExtraOperator '\v\,'
syntax match javaExtraOperator '\v\-'
syntax match javaExtraOperator '\v\.'
syntax match javaExtraOperator '\v\:'
syntax match javaExtraOperator '\v\;'
syntax match javaExtraOperator '\v\<'
syntax match javaExtraOperator '\v\='
syntax match javaExtraOperator '\v\>'
syntax match javaExtraOperator '\v\?'
syntax match javaExtraOperator '\v\{'
syntax match javaExtraOperator '\v\|'
syntax match javaExtraOperator '\v\}'
syntax match javaExtraOperator '\v\~'

highlight link javaExtraOperator ExtraOperator
