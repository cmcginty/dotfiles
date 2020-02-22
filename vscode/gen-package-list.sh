#!/usr/bin/env bash
set -eou pipefail
IFS=$'\n\t'

if hash code-fb; then
   VSCODE=code-fb
else
   VSCODE=code
fi

$VSCODE --list-extensions | grep -v nuclide > package-list.txt
