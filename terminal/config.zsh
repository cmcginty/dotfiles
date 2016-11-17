# disable XON/XOFF Ctrl-S ctrl-Q in terminals (bad for VIM)
stty -ixon

# disable Ctrl-L (clear_screen) to prevent accidental usage
bindkey '\C-l' undefined-key

if [[ "$OSTYPE" == darwin* ]]; then
   # increase key repeat rate
   defaults write -g InitialKeyRepeat -int 14   # normal minimum is 15 (225 ms)
   defaults write -g KeyRepeat -int 2           # normal minimum is 2 (30 ms)
fi
