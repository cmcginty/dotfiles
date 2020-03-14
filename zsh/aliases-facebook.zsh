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

# Create a new paste that shows the actual command used to generate it:
#   Ex:
#       my-cmd | paste-in
#       pastry-add-cmd
pastry-add-cmd() {
    local LAST_COMMAND="$(history -1 | sed -e 's/\s*[0-9]*\s*//')"
    { echo "\$ ${LAST_COMMAND}" & pastry ${PASTE_ID}; } | pastry
}

# Create a paste of file and output command used to "copy" the file.
# NOTE: pbcopy only works in an ondemand
pastry-send() {
    cat $1 | pastry-get-id >/dev/null
    echo -n "pastry ${PASTE_ID} > $1" | tee >(pbcopy)
}

alias ab='arc build'
alias arb='arc rebuild --disable-smart'
alias au='arc unit'

alias deploy='/var/www/scripts/sandcastle/deploy.php'

alias php-dbg='hphpd -h localhost'
alias php='HPHPI_OPTIONS=Eval.EnablePHP=1 php'
