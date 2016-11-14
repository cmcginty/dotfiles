#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

if [[ "$OSTYPE" == darwin* ]]; then
   # increase key repeat rate
   defaults write -g InitialKeyRepeat -int 10   # normal minimum is 15 (225 ms)
   defaults write -g KeyRepeat -int 1           # normal minimum is 2 (30 ms)

   # add command line tools
   xcode-select -p >/dev/null || xcode-select --install

   # install homebrew
   hash brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
