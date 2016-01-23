# generate the .ssh/config
# start with local config if exists, since order matters
if [[ -e $HOME/.ssh/config.local ]]; then
   cat $HOME/.ssh/config.local >! $HOME/.ssh/config
fi

# append files from .ssh/config.d/*
cat $HOME/.dotfiles/ssh/config.d/* >>! $HOME/.ssh/config
