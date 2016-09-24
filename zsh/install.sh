#!/bin/bash
set -eou pipefail
IFS=$'\n\t'

# test is zsh exists
hash zsh 2>/dev/null || sudo apt-get install -y zsh 2>/dev/null
# set zsh as default shell
if [[ $(getent passwd $USER | cut -d: -f7) != "/bin/zsh" ]]; then
   chsh -s /bin/zsh
fi
