#!/bin/bash

# TODO: Add homebrew base install step

if [[ "$OSTYPE" == darwin* ]]; then
  test -d /Applications/KeePassXC.app || brew cask install keepassxc
  test -d /Applications/Rectangle.app || brew cask install rectangle
  test -d /Applications/iGlance.app || brew cask install iglance
fi
