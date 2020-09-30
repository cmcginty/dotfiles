#!/bin/bash

set -uo pipefail

# Author : Teddy Skarin
function ProgressBar {
	((_progress = ${1} *10000 / ${2} /100 ))
	((_done = _progress * 4 / 10))
	((_left = 40 - _done))
	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")
	printf "\rProgress : [${_done// /#}${_left// /-}] ${_progress}%%"
}

URLS=$(cat | grep -E -o 'https?://[^ ]+' | sort -u)
TOTAL=$(echo "$URLS" | wc -l )
i=0
while read -r URL
do
	[[ -n "$URL" ]] || { exit 1; }
	((i++))
	open "$URL"
	ProgressBar "$i" "$TOTAL"
	[[ $i -lt $TOTAL ]] && sleep 1.5
done < <(echo "$URLS")

printf '\nFinished!\n'
