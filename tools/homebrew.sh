#!/bin/bash

# TODO: Add homebrew base install step

if [[ "$OSTYPE" == darwin* ]]; then
  test -d /Applications/KeePassXC.app || brew install keepassxc --cask
  test -d /Applications/Rectangle.app || brew install rectangle --cask
  test -d /Applications/iGlance.app || brew install iglance --cask
  test -d /Applications/Keybase.app || brew install keybase --cask
fi
