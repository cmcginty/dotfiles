# Facebook CLI tools

# Store the paste ID when creating a new paste. Then use pastry-add-cmd to
# prepend the shell command to the paste.
function pastry-get-id() {
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
function pastry-add-cmd() {
    local LAST_COMMAND="$(history -1 | sed -e 's/\s*[0-9]*\s*//')"
    { echo "\$ ${LAST_COMMAND}" && pastry ${PASTE_ID}; } | pastry
}
alias pcmd='pastry-add-cmd'

# Create a paste of file and output command used to "copy" the file.
#   NOTE: pbcopy only works in an ondemand
function pastry-send() {
    cat $1 | pastry-get-id >/dev/null
    echo -n "pastry ${PASTE_ID} > $1" | tee >(pbcopy)
}
alias psend='pastry-send'

alias unix2email='while read -r; do echo $REPLY@fb.com; done'

# Www
alias deploy='/var/www/scripts/sandcastle/deploy.php'
alias gencode='/var/www/scripts/entschema/gencode'
alias gensandcastle='phps SandcastleAutogenScript'
alias hack='hphpd -h localhost'

# Sandcastle
alias odc='ondemand connect'
function scutil-retry() { scutil get-spec $1 | grep -v nonce | scutil canary-command --parameters-stdin; }

# Arc
alias ar='arc rebuild'
alias arb='arc rebuild'
alias au='arc unit'

alias pm='pingme'
alias fin="pingme \"\$(hostname | rg -o '^\w+\.\w+') READY\""

# Mercurial/Phabricator
alias h='hg'
alias jfs='jf submit'
alias jfsu='jf submit --update-fields'

# Vscode (server-side)
alias fixvscode='sudo systemctl restart vscode-daemon && kill $(lsof -t -i :9092)'

# Certificates
alias renew_certs='openssl x509 -checkend $((3600*4)) -noout -in /var/facebook/credentials/cmcginty/presto/cmcginty.pem || cc-certs -duo_pass push'
alias renew_dev='expect -c "spawn renew_creds devvm3470.ftw3.facebook.com; expect Passcode\ or\ option\ (1-1):; send push\r; expect eof"'
alias renew='renew_certs && renew_dev'

# Everstore
alias esget='clowder get'
function espatch() { (clowder get $1 - 2>/dev/null && echo "") | patch -p1; }
