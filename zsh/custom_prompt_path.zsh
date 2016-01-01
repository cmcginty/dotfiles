#Load themes from dotfiles and from user's custom prompts (themes) in ~/.zsh.prompts

fpath=($HOME/.zsh.prompts $HOME/.dotfiles/zsh/prompts $fpath)
promptinit
