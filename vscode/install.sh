#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$OSTYPE" == darwin* ]]; then
   # Try to install vscode ... No guarantee this will work.
   hash code || $(wget 'https://go.microsoft.com/fwlink/?LinkID=620882' -O /tmp/vscode.zip; open /tmp/vscode.zip)

   # Install all missing packages from package-list.txt created by:
   #    code --list-extensions > package-list.txt
   cat $BASEDIR/package-list.txt | xargs -n 1 code --force --install-extension
fi
