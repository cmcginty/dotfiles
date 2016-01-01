# Use zmv, which is amazing
#
# You can do simple stuff, like changing the suffix on a bunch of .txt files to
# .markdown
#
#     zmv -W '*.txt' '*.markdown'
#
# or make file and directory names lowercase
#
#     zmv '(*)' '${(L)1}'
#
autoload -U zmv
alias zmv="noglob zmv -W"
