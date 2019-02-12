# disable XON/XOFF Ctrl-S ctrl-Q in terminals (bad for VIM)
stty -ixon

# disable Ctrl-L (clear_screen) to prevent accidental usage
bindkey '\C-l' undefined-key

if [[ "$OSTYPE" == darwin* ]]; then
   # increase key repeat rate
   defaults write -g InitialKeyRepeat -int 14   # normal minimum is 15 (225 ms)
   defaults write -g KeyRepeat -int 2           # normal minimum is 2 (30 ms)
   # Enable sub-pixel rendering in Mojave
   defaults write -g CGFontRenderingFontSmoothingDisabled -bool FALSE

   # fix homebrew dir permissions
   alias brewfix="sudo chown -R $(whoami) /usr/local/lib /usr/local/sbin"

   # replace legacy UNIX tools with OSX-only commands
   alias cat='bat'
   alias less='bat --wrap=never'
   alias du='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
   alias help='tldr'
   alias noti='noti -bs'  # banner/speak when done
   alias notiw='noti -w $!'  # watch the last process
   alias ping='prettyping --nolegend'
fi

# replace legacy UNIX tools with improved commands
alias grep='rg'
alias top='sudo htop'
alias rgl='rg --files-with-matches'

# ---------------------
# FZF fuzzy searcher
# NOTE: Set "Option" key to Esc+ in Iterm->Preferences->Profile->Keys

local FZF_CTRLO="ctrl-o:execute-silent(gvim {})+abort"          # Ctrl-O open file in vim
local FZF_CTRLY="ctrl-y:execute-silent(echo {}|pbcopy)+abort"   # Ctrl-Y copy the line

export FZF_DEFAULT_COMMAND="fd --type f"                            # use fd
export FZF_ALT_C_COMMAND="fd --type d"                              # use fd
export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"          # enable visual tree
export FZF_DEFAULT_OPTS="--bind='$FZF_CTRLO,$FZF_CTRLY'"            # bind keys
export FZF_TMUX=1                                                   # tmux support
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"

alias preview="fzf --preview 'bat --color \"always\" {}'"
# preview all files that contain string
function rgp() { rg --files-with-matches $@ | preview }
