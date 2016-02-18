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
alias p4admin='p4admin &'
alias p4v='p4v &'

# recursively replace text string
function replace() { find . -name "${1}" -type f -exec sed -i "s/${2}/${3}/g" {} \+ }
