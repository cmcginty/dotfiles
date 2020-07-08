#!/bin/bash

test -d /Applications/BitBar.app || brew cask install bitbar
pip3 install --user --quiet --upgrade yfinance six lxml
