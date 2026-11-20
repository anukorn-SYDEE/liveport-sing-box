#!/bin/bash
# Build the LiVEport sing-box: official source + 0001-liveport-no-reset.patch (keep connections when
# the default route changes; enabled only with LIVEPORT_NO_RESET=1, set in liveport-mptcp.service).
# usage: bash build.sh [version]   -> ./sing-box-<ver>-lp1-arm64   (needs Go >= go.mod's, curl, patch)
set -eu
V=${1:-1.14.4}
HERE=$(cd "$(dirname "$0")" && pwd)
T=$(mktemp -d)
curl -fsSL "https://github.com/SagerNet/sing-box/archive/refs/tags/v$V.tar.gz" | tar -xz -C "$T"
cd "$T/sing-box-$V"
patch -p1 < "$HERE/0001-liveport-no-reset.patch"
CGO_ENABLED=0 GOOS=linux GOARCH=arm64 GOTOOLCHAIN=local go build -trimpath \
	-ldflags "-s -w -X github.com/sagernet/sing-box/constant.Version=$V-lp1" -o "$HERE/sing-box-$V-lp1-arm64" ./cmd/sing-box
rm -rf "$T"
sha256sum "$HERE/sing-box-$V-lp1-arm64"
