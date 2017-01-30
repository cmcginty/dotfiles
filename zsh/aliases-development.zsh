# Development Commands

# Java
alias eclipse='eclipse >/dev/null &'
alias jad-ni='jad -noinner'
alias jad='jad -d . -s java -ff -noctor -o -space -pi100 -v -lnc'
alias jks-ls='keytool -list -v -keystore'
alias tattletale='java -Xmx512m -jar ~/src/tattletale/tattletale.jar'
function grep-ant() { g ls | grep -i 'build.*.xml' | xargs -i grep -H -i "${1}" '{}' }
function grep-gradle() { g ls | grep -i .gradle | xargs -i grep -H -i "${1}" '{}' }

# Java source files using ARG imports
function java-imports() { grep -rh ^import --include="*.java" $@ | sed -r "s/import (.*)\..+;/\1/" | sort -u }

# Perforce
if [[ $(uname) == 'Darwin' ]]; then
   alias p4merge='/Applications/p4merge.app/Contents/Resources/launchp4merge'
fi
alias p4admin='p4admin &'
alias p4v='p4v &'
alias p4lg='p4 changes'
alias p4lgm-me='p4lg -lt --me'
alias p4lgm-last='p4lgm-me -m 1'

# recursively replace text string
function replace() { find . -name "${1}" -type f -exec sed -i "s/${2}/${3}/g" {} \+ }

# SSL commands
function ssl-x509-header() { openssl crl2pkcs7 -nocrl -certfile $1 | openssl pkcs7 -print_certs }
alias ssl-p12-ls='openssl pkcs12 -in'
alias ssl-rsa-ls='openssl rsa -noout -text -in'
alias ssl-rsa-mod='openssl rsa -noout -modulus -in'
alias ssl-x509-ls='openssl x509 -noout -text -fingerprint -md5 -in'
alias ssl-x509-mod='openssl x509 -noout -modulus -in'
alias ssl-x509der-issuer='openssl x509 -inform der -noout -issuer -in'
alias ssl-x509der-ls='openssl x509 -inform der -noout -text -fingerprint -md5 -in'

# curl/httpie
alias http='http --verbose --style=monokai'
