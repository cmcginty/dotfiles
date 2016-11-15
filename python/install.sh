#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

if [[ "$OSTYPE" == linux* ]]; then
   # FIXME: switch to pyenv-virtualenv
   # dpkg -l virtualenvwrapper >/dev/null || sudo apt-get install -y virtualenvwrapper
   true
elif [[ "$OSTYPE" == darwin* ]]; then
   # TODO: is python installed already?
   brew list python >/dev/null            || brew install python
   brew list pyenv >/dev/null             || brew install pyenv
   brew list pyenv-virtualenv >/dev/null  || brew install pyenv-virtualenv
fi
