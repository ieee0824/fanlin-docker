#!/bin/bash -e

FANLIN_VERSION="v1.1.0"
HASH=$(git rev-parse --verify HEAD)
BUILDDATE=$(date '+%Y/%m/%d %H:%M:%S %Z')
GOVERSION=$(go version)

git clone https://github.com/wfarr/goenv.git $HOME/.goenv 
export PATH=$HOME/.goenv/bin:$PATH
eval "$(goenv init -)"

goenv install 1.7.1
goenv global 1.7.1

mkdir -p $HOME/go

export GOPATH=$HOME/go

go get -v github.com/livesense-inc/fanlin/cmd/fanlin

GOOS=linux GOARCH=amd64 go build -ldflags "-X \"main.buildVersion=${FANLIN_VERSION}\" -X \"main.buildDate=${BUILDDATE}\" -X \"main.goversion=${GOVERSION}\"" github.com/livesense-inc/fanlin/cmd/fanlin

ls -a

file fanlin
