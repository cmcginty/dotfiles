#!/bin/bash

set +e

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
hash autopep8           || sudo pip install --upgrade autopep8
hash clang-format-3.5   || sudo apt-get install -y clang-format-3.5
hash js-beautify        || sudo npm install -g js-beautify
hash remark             || sudo npm install -g remark
hash tidy               || sudo apt-get install -y tidy

# clean install/update plugins
vi '+PlugClean|only' +PlugUpdate +sleep1 +qall
