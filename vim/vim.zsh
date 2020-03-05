# Vim

if [[ $(hash gvim 2> /dev/null) ]]; then
    alias sdvi='sudo gvim -p > /dev/null 2>&1'
    alias vi='gvim > /dev/null 2>&1'
    alias vim='gvim > /dev/null 2>&1'
fi