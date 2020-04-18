# Facebook CLI tools

# Store the paste ID when creating a new paste. Then use pastry-add-cmd to
# prepend the shell command to the paste.
pastry-get-id() {
    PASTE_ID=P$(
        pastry --json |
        jq -r "select(.type==\"data\") | .data.createdPaste.id"
    )
    echo "https://our.intern.facebook.com/intern/paste/${PASTE_ID}"
}
alias pgid='pastry-get-id'

# Create a new paste that shows the actual command used to generate it:
#   Ex:
#       my-cmd | pastry-get-id
#       pastry-add-cmd
pastry-add-cmd() {
    local LAST_COMMAND="$(history -1 | sed -e 's/\s*[0-9]*\s*//')"
    { echo "\$ ${LAST_COMMAND}" && pastry ${PASTE_ID}; } | pastry
}
alias pcmd='pastry-add-cmd'

# Create a paste of file and output command used to "copy" the file.
#   NOTE: pbcopy only works in an ondemand
pastry-send() {
    cat $1 | pastry-get-id >/dev/null
    echo -n "pastry ${PASTE_ID} > $1" | tee >(pbcopy)
}
alias psend='pastry-send'

alias deploy='/var/www/scripts/sandcastle/deploy.php'
alias php-dbg='hphpd -h localhost'

# Sandcastle
alias odc='ondemand connect'

# Arc
alias ab='arc build'
alias arb='arc rebuild --disable-smart'
alias arb='arc rebuild --disable-smart'
alias au='arc unit'

alias pm='pingme'
alias fin="pingme $HOSTNAME READY"

# Mercurial/Phabricator
alias h='hg'
alias jfs='jf submit'
alias jfsu='jf submit --update-fields'
