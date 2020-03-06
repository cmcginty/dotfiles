#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

if [[ $IS_FB_HOST ]]; then
   # Update tmux to latest release
   sudo yum update --assumeyes tmux

elif [[ "$OSTYPE" == linux* ]]; then
   hash tmux || sudo apt-get install tmux

elif [[ "$OSTYPE" == darwin* ]]; then
   hash tmux || brew install tmux
   hash reattach-to-user-namespace || brew install reattach-to-user-namespace
fi
