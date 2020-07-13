#!/bin/bash

if [[ "$OSTYPE" == darwin* ]]; then
  test -d /Applications/BitBar.app || brew cask install bitbar
  pip3 install --user --quiet --upgrade yfinance six lxml
fi
