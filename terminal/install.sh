#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

if [[ "$OSTYPE" == darwin* ]]; then
   # add command line tools
   xcode-select --install 2> /dev/null || true
   # install homebrew
   hash brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   # install ripgrep
   hash rg || brew install ripgrep
   # install GNU PGP
   hash gpg || brew install gpg2
   hash keybase || brew cask install keybase
   # install mosh SSH client
   hash mosh || brew install mosh
   # install moreutils for useful command line tools
   hash sponge || brew install moreutils
   # install bat for improved "cat"
   hash bat || brew install bat
   # install visual "ping"
   hash prettyping || brew install prettyping
   # install colorized "top"
   hash htop || brew install htop
   # install colorized diff for git
   hash diff-so-fancy || brew install diff-so-fancy
   # install improved "find" tool
   hash fd || brew install fd
   # install improved disk usage visualizer
   hash ncdu || brew install ncdu
   # install simplified man pages
   hash tldr || brew install tldr
   # install JSON parser
   hash jq || brew install jq
   # install desktop CLI notifier
   hash noti || brew install noti
   # install colorized "curl"
   hash http || brew install httpie
   # install fzf fuzzy searcher "Ctrl-R" support
   hash fzf || brew install fzf
   if [[ ! -f ~/.fzf.zsh ]]; then
      $(brew --prefix)/opt/fzf/install
   fi
   # install pv to monitor slow shell pipe commands
   hash pv || brew install pv
   # install GNU findutils
   hash gfind || brew install findutils
   # Setup iterm2 preference saving
   defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/terminal"
   defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
elif [[ "OSTYPE" == linux* ]]; then
   # install fzf fuzzy searcher "Ctrl-R" support
   hash fzf 2>/dev/null || (
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
      ~/.fzf/install --all
   )
fi
