#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$OSTYPE" == darwin* ]]; then

   # Skip installing public VS code if FB version exists.
   if hash code-fb 2>/dev/null; then
      # Install all missing packages from package-list.txt created by:
      #    gen-package-list.sh
      # cat $BASEDIR/package-list.txt | xargs -n 1 code-fb --force --install-extension || true

      HOMEDIR=~/.ondemand/homedir/
      mkdir -p $HOMEDIR
      ln -fs $HOME/.hgrc $HOMEDIR
      ln -fs $HOME/.gitconfig $HOMEDIR
      ln -fs $HOME/.dotfiles/zsh/aliases-facebook.zsh $HOMEDIR/.aliases
   else
      # Try to install vscode ... No guarantee this will work.
      hash code 2>/dev/null || $( \
         wget 'https://go.microsoft.com/fwlink/?LinkID=620882' -O /tmp/vscode.zip; \
         open /tmp/vscode.zip \
      )
   fi

   # Also update public VS Code if it was manually installed.
   if hash code 2>/dev/null; then
      # Install all missing packages from package-list.txt created by:
      #    code --list-extensions > package-list.txt
      cat $BASEDIR/package-list.txt | xargs -n 1 code --force --install-extension
   fi

   # Enable key repeat
   defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
   defaults write com.facebook.fbvscode ApplePressAndHoldEnabled -bool false
fi
