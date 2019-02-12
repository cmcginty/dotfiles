# Install the GOPATH/bin if golang is installed
if hash go 2> /dev/null; then
   export GOPATH=$(go env GOPATH)
   path=($path $GOPATH/bin)
fi
