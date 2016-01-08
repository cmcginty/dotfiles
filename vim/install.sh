#!/bin/bash

set +e

hash gvim || sudo apt-get install -y vim vim-gnome

# clean install/update plugins
vi '+PlugClean|only' +PlugUpdate +sleep1 +qall
