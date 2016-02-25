# disable XON/XOFF Ctrl-S ctrl-Q in terminals (bad for VIM)
stty -ixon

# disable Ctrl-L (clear_screen) to prevent accidental usage
bindkey '\C-l' undefined-key
