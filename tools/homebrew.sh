#!/bin/bash

# TODO: Add homebrew base install step

if [[ "$OSTYPE" == darwin* ]]; then
  test -d /Applications/KeePassXC.app || brew install keepassxc --cask
  test -d /Applications/Rectangle.app || brew install rectangle --cask
  test -d /Applications/Stats.app || brew install stats --cask
  test -d "/Applications/Silicon Info.app" || brew install silicon-info --cask
  test -d /Applications/LinearMouse.app || brew install linearmouse --cask
fi
