#!/bin/bash

set -e

# test is zsh exists
hash zsh || sudo apt-get install zsh
# set zsh as default shell
if [[ $(getent passwd $USER | cut -d: -f7) != "/bin/zsh" ]]; then
   chsh -s /bin/zsh
fi
