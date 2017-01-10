#!/bin/bash
set -eou pipefail
IFS=$'\n\t'

if [[ "$OSTYPE" == linux* ]]; then
   mkdir -p ~/.local/share/fonts
   cd ~/.local/share/fonts
elif [[ "$OSTYPE" == darwin* ]]; then
   cd ~/Library/Fonts
fi

REPO="https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0"
URL="$REPO/UbuntuMono.zip"
FILE=$(sed 's/%20/ /g' <<<${URL##*/})

if [[ ! -e "$FILE" ]]; then
   curl -fLo "$FILE" "${URL}?raw=true"
   unzip -o $FILE '*Mono.ttf'
   if [[ "$OSTYPE" == linux* ]]; then
      sudo fc-cache -f -v
   fi
fi
