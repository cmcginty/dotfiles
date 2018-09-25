# disable XON/XOFF Ctrl-S ctrl-Q in terminals (bad for VIM)
stty -ixon

# disable Ctrl-L (clear_screen) to prevent accidental usage
bindkey '\C-l' undefined-key

if [[ "$OSTYPE" == darwin* ]]; then
   # increase key repeat rate
   defaults write -g InitialKeyRepeat -int 14   # normal minimum is 15 (225 ms)
   defaults write -g KeyRepeat -int 2           # normal minimum is 2 (30 ms)
fi

# fix homebrew dir permissions
alias brewfix="sudo chown -R $(whoami) /usr/local/lib /usr/local/sbin"

# replace legacy unix tools with newer versions
alias cat='bat'
alias ping='prettyping --nolegend'
alias top="sudo htop"
alias du='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
alias help='tldr'
alias noti='noti -bs'  # banner/speak when done

## FZF fuzzy searcher
# NOTE: Set "Option" key to Esc+ in Iterm->Preferences->Profile->Keys
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"  # enable visual tree
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(gvim {})+abort'"  # Ctrl-O opens file in vim
export FZF_TMUX=1  # tmux support
alias preview="fzf --preview 'bat --color \"always\" {}'"
