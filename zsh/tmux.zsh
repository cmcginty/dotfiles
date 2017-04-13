# Reset the term name after SSH exits.
# TODO: Update this to set windows as a short directory name.
add-zsh-hook precmd f(){tmux rename-window "zsh"}

# Wrap SSH command so that window gets renamed correctly
ssh() {
   OLD_NAME=$(tmux display-message -p '#W')
   tmux rename-window "${@[-1]}"    # rename window using last arg
   command ssh $@
   tmux rename-window "$OLD_NAME"   # restore previous name
}
