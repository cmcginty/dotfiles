#!/bin/bash
set -eou pipefail
IFS=$'\n\t'

if [[ "$OSTYPE" == linux* ]]; then

   hash gvim || sudo apt-get install -y vim vim-gnome
   # enable trusty-backports
   grep -q trusty-backports /etc/apt/sources.list.d/additional-repositories.list ||
      (sudo apt-add-repository "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse" &&
       sudo apt-get update)
   # install dependency
   hash nodejs    || sudo apt-get install -y nodejs
   hash node      || sudo ln -s /usr/bin/nodejs /usr/bin/node
   hash npm       || sudo apt-get install -y npm
   # code formatters
   hash astyle             || sudo apt-get install -y astyle/trusty-backports
   hash clang-format       || sudo apt-get install -y clang-format
   hash js-beautify        || sudo npm install -g js-beautify
   hash remark             || sudo npm install -g remark
   hash tidy               || sudo apt-get install -y tidy
   hash yapf               || sudo pip install --upgrade yapf

elif [[ "$OSTYPE" == darwin* ]]; then

   hash gvim   || brew install macvim --with-override-system-vim
   hash node   || brew install node
   hash npm    || brew install npm
   hash ctags  || brew install ctags
   # code formatters
   hash astyle             || brew install astyle
   hash clang-format       || brew install clang-format
   hash js-beautify        || npm install -g js-beautify
   hash remark             || npm install -g remark
   hash tidy               || brew install -y tidy
   hash yapf               || pip install --upgrade yapf

fi

# clean install/update plugins
vim '+PlugClean|only' +PlugUpdate +sleep1 +qall
