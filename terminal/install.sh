#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

if [[ "$OSTYPE" == darwin* ]]; then
   # add command line tools
   xcode-select -p >/dev/null || xcode-select --install

   # install homebrew
   hash brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

   # install ripgrep
   hash rg || brew install ripgrep

   # install GNU PGP
   hash gpg || brew install gpg2
fi
