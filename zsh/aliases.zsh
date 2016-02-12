# Ubuntu apt-get
alias apt-get='sudo apt-get'
alias aptar='apt-get autoremove'
alias aptin='apt-get install'
alias aptrm-conf='aptitude -F %p search "~c" | xargs sudo dpkg -P'
alias aptrm='apt-get purge'
alias aptug='apt-get upgrade'
alias aptup='apt-get update'

# tweet a string of text
function t() { echo "$@" | bti }

# file-roller (fix multiple instance bug)
function fr() { for F in $@; do file-roller $(readlink -f $F) & done }

# remote desktop
alias rdesktop='rdesktop -x l -g 1024x768 -a 16 -k en-us'
alias rdp='rdesktop'

# SSL commands
alias ssl-p12-ls='openssl pkcs12 -in'
alias ssl-rsa-ls='openssl rsa -noout -text -in'
alias ssl-rsa-mod='openssl rsa -noout -modulus -in'
alias ssl-x509-issuer='openssl x509 -noout -issuer -in'
alias ssl-x509-ls='openssl x509 -noout -text -fingerprint -md5 -in'
alias ssl-x509-mod='openssl x509 -noout -modulus -in'
