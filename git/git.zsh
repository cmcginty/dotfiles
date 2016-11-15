# git
alias gdg='git ls-files | grep -i'
alias gk='gitk'
alias gka='gitk --all'

if [[ "$OSTYPE" == darwin* ]]; then
  alias gitk=gitx
fi
