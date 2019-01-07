#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$OSTYPE" == darwin* ]]; then
   hash atom || brew cask install atom

   # Install all missing packages from package-list.txt created by:
   #    apm list --installed --bare > package-list.txt
   INSTALLED_PKGS=$(apm list --installed --bare)
   for PKG in $(cut -f1 -d@ $BASEDIR/package-list.txt); do
      grep -q $PKG <<< $INSTALLED_PKGS || apm install $PKG
   done

   apm upgrade --no-confirm >/dev/null
fi
