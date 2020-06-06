#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

if [[ "$OSTYPE" == linux* ]]; then
   # FIXME: switch to pyenv-virtualenv
   # dpkg -l virtualenvwrapper >/dev/null || sudo apt-get install -y virtualenvwrapper
   true
elif [[ "$OSTYPE" == darwin* ]]; then
   # install brew python for pip support
   hash python3             || brew install python
   hash pyenv               || brew install pyenv
   hash pyenv-virtualenv    || brew install pyenv-virtualenv
   hash black               || brew install black
fi
