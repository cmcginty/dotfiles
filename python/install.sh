#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

dpkg -l virtualenvwrapper >/dev/null || sudo apt-get install -y virtualenvwrapper
