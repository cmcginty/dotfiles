#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

if [[ "$OSTYPE" == linux* ]]; then
   dpkg -l virtualenvwrapper >/dev/null || sudo apt-get install -y virtualenvwrapper
elif [[ "$OSTYPE" == darwin* ]]; then
   # TODO: is python installed already?
   brew list python >/dev/null || brew install python

   pip list 2>/dev/null | grep -q virtualenv || pip install virtualenv
   pip list 2>/dev/null | grep -q virtualenvwrapper || pip install virtualenvwrapper

#   hash pyenv 2>/dev/null || brew install pyenv
fi
