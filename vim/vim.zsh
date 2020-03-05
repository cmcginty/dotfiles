# Vim

hash gvim 2> /dev/null && VIM=gvim || VIM=vim

alias sdvi="sudo $VIM -p > /dev/null 2>&1"
alias vi="$VIM > /dev/null 2>&1"
alias vim="$VIM > /dev/null 2>&1"