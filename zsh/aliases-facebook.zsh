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
alias jest-e2e='http_proxy= jest-e2e'
alias t='testpilot'

# Sandcastle
alias odc='ondemand connect'
function scutil-retry() { scutil get-spec $1 | grep -v nonce | scutil canary-command --parameters-stdin; }

# Arc
alias ar='arc rebuild'
alias arb='arc rebuild'
alias unit='arc unit --no-time-limit'

alias pm='pingme'
alias fin="pingme \"\$(hostname | rg -o '^\w+\.\w+') READY\""

# Mercurial/Phabricator
alias h='hg'
alias jfs='jf submit --draft'
alias jft='jf template'
alias jfdraft='jf submit --draft'
alias jfpublish='jf submit --publish-when-ready --no-skip'
alias jfpull='jf sync'
alias jfpush='jf submit --draft --update'
alias jfwip='jf submit --plan-changes --no-skip'

# Vscode (server-side)
alias fixvscode='sudo systemctl restart vscode-daemon; sleep 5; sudo kill -15 $(sudo lsof -ti :9094)'
alias kill-hh='pkill -f "(hh_server|hh_client)"'

# Certificates
FB_DEV_HOST='devvm4991.prn0.facebook.com'
alias renew-certs='openssl x509 -checkend $((3600*4)) -noout -in /var/facebook/credentials/cmcginty/presto/cmcginty.pem || cc-certs -duo_pass push'
alias renew-dev="expect -c \"spawn renew_creds $FB_DEV_HOST; expect Passcode\ or\ option\ (1-1):; send push\r; expect eof\""
alias renew='renew-certs && renew-dev'

# Everstore
alias esget='clowder get'
function espatch() { (clowder get $1 - 2>/dev/null && echo "") | patch -p1; }

# JEST
function jest-snap-repair() {
   hg pull &&
   hg co master &&
   jest -u html/intern/js/jest/__tests__/InlineSnapshotExample-test.js &&
   hg commit --addremove -m \
"[jest] Cleanup snapshots

Summary:
Remove obsolete snapshots

Test Plan:
 jest -u html/intern/js/jest/__tests__/InlineSnapshotExample-test.js

Reviewers: #releng-www
" &&
   jf submit
}
