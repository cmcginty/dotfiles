# Vim

hash gvim 2> /dev/null && VIM=gvim || VIM=vim

alias sdvi="sudo $VIM -p"
alias vi="$VIM"

if [[ $VIM != "vim" ]]; then
    alias vim="$VIM"
fi