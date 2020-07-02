#!/bin/bash
set -eou pipefail
IFS=$'\n\t'

# Fail if inside of a virtual environment
set +u
if [[ -n "$PYENV_VERSION" ]] && [[ "$PYENV_VERSION" != "system" ]]; then
   echo ERROR: PYENV set to \"$PYENV_VERSION\"
   exit 1
fi

if [[ -n ${IS_FB_HOST} ]]; then

   # Install 8.x vim release
   sudo feature install fb-vim

elif [[ "$OSTYPE" == linux* && -f /etc/debian_version ]]; then

   hash gvim || sudo apt-get install -y vim vim-gnome
   # enable trusty-backports
   grep -q trusty-backports /etc/apt/sources.list.d/additional-repositories.list ||
      (sudo apt-add-repository "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse" &&
       sudo apt-get update)
   # install dependency
   hash nodejs    || sudo apt-get install -y nodejs
   hash node      || sudo ln -s /usr/bin/nodejs /usr/bin/node
   hash npm       || sudo apt-get install -y npm
   hash ctags     || sudo apt-get install ctags
   # code formatters
   hash astyle             || sudo apt-get install -y astyle/trusty-backports
   hash clang-format       || sudo apt-get install -y clang-format
   hash js-beautify        || sudo npm install -g js-beautify
   hash remark             || sudo npm install -g remark-cli
   hash tidy               || sudo apt-get install -y tidy

elif [[ "$OSTYPE" == darwin* ]]; then

   hash python3 || brew install python3
   hash gvim   || brew install macvim
   hash node   || brew install node
   hash npm    || brew install npm
   hash ctags  || brew install ctags
   # code formatters
   hash astyle             || brew install astyle
   hash clang-format       || brew install clang-format
   hash js-beautify        || npm install -g js-beautify
   hash remark             || npm install -g remark-cli
   hash tidy               || brew install -y tidy

   # isort: vim-isort dependency
   pip3 install --quiet --upgrade isort
   # black: ambv/black dependency
   pip3 install --quiet --upgrade black

   # disable auto-update prompts
   defaults write org.vim.MacVim SUEnableAutomaticChecks -bool false
   # disable title bar (set true)
   defaults write org.vim.MacVim MMNoTitleBarWindow false
   # fix blank/black screen issues
   defaults write org.vim.MacVim MMUseCGLayerAlways -bool YES
fi
set -u

# clean install/update plugins
vim '+PlugClean|only' +PlugUpdate +sleep1 +qall
