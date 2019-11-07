#!/bin/sh

set -e

WORKDIR="/home/icingadb/go/src/github.com/${GITHUB_REPOSITORY}"

echo "${GITHUB_REPOSITORY}"
echo "${WORKDIR}"

mkdir -p "$(dirname "${WORKDIR}")"
ln -s "${PWD}" "${WORKDIR}"

chown -R icingadb: ${PWD}

su icingadb

cd "${WORKDIR}"

export GOPATH="/home/icingadb/go"
/home/icingadb/go/bin/dep ensure

go fmt $(go list ./... | grep -v /vendor/)
go vet $(go list ./... | grep -v /vendor/)
go test -race $(go list ./... | grep -v /vendor/) -cover

