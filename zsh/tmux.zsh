# Reset the term name after SSH exits.
# TODO: Update this to set windows as a short directory name.
add-zsh-hook precmd f(){tmux rename-window "zsh"}
