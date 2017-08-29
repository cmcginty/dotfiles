# Install the GOPATH/bin if golang is installed
if hash go; then
   export GOPATH=$(go env GOPATH)
   path=($path $GOPATH/bin)
fi
