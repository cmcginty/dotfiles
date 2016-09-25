#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

hash virtualenvwrapper || sudo apt-get install -y virtualenvwrapper
