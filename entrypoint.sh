#!/bin/sh

set -e

WORKDIR="${GOPATH}/src/github.com/${GITHUB_REPOSITORY}"

echo "${GITHUB_REPOSITORY}"
echo "${WORKDIR}"

echo $(ls)

mkdir -p "$(dirname "${WORKDIR}")"
ln -s "${PWD}" "${WORKDIR}"
cd "${WORKDIR}"
echo "${PWD}"

echo $(ls)

dep ensure

go fmt $(go list ./... | grep -v /vendor/)
go vet $(go list ./... | grep -v /vendor/)
go test -race $(go list ./... | grep -v /vendor/) -cover

