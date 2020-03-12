# Vim

hash gvim 2> /dev/null && VIM=gvim || VIM=vim

alias sdvi="sudo $VIM -p"
alias vi="$VIM"

if [[ $VIM != "vim" ]]; then
    alias vim="$VIM"
fi

# Setting VIM causes the prompt to print "V" before repo info.
unset VIM
