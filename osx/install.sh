#!/bin/bash
set -eou pipefail

if [[ "$OSTYPE" != darwin* ]]; then
    exit
fi

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
for config_file in $BASEDIR/*.cfg; do source "$config_file"; done
