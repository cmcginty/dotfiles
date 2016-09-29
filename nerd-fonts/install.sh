#!/bin/bash
set -eou pipefail
IFS=$'\n\t'

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

REPO="https://github.com/ryanoasis/nerd-fonts/blob/0.8.0/patched-fonts"
URL="$REPO/UbuntuMono/Regular/complete/Ubuntu%20Mono%20derivative%20Powerline%20Nerd%20Font%20Complete.ttf"

FILE=$(sed 's/%20/ /g' <<<${URL##*/})

if [[ ! -e "$FILE" ]]; then
   curl -fLo "$FILE" "${URL}?raw=true"
   sudo fc-cache -f -v
fi
