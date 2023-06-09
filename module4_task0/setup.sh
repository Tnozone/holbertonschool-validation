#!/bin/bash

apt-get update && sudo apt-get install -y make curl

## Add official nodejs distribution apt repository
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y --no-install-recommends nodejs=14.*

# Download Hugo binary
HUGO_VERSION="0.84.0"
HUGO_BINARY="hugo_extended_${HUGO_VERSION}_Linux-64bit.deb"
curl -LO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}"
dpkg -i ${HUGO_BINARY}
rm ${HUGO_BINARY}

# Install golangci-lint
curl --silent --show-error --location --output /tmp/golangci-lint.deb \
	"https://github.com/golangci/golangci-lint/releases/download/v1.52.2/golangci-lint-1.52.2-linux-amd64.deb"
dpkg -i /tmp/golangci-lint.deb
rm -f /tmp/golangci-lint.deb

npm install --global \
	markdownlint-cli@0.26.0 \
	markdown-link-check@3.8.6

exit $?
