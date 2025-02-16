#!/bin/bash -e
VERSION=v3.21
RELEASE=alpine-minirootfs-3.21.3-x86_64
curl -sSO https://dl-cdn.alpinelinux.org/alpine/$VERSION/releases/x86_64/$RELEASE.tar.gz
curl -sSO https://dl-cdn.alpinelinux.org/alpine/$VERSION/releases/x86_64/$RELEASE.tar.gz.sha256
sha256sum -c $RELEASE.tar.gz.sha256
mv $RELEASE.tar.gz alpine-minirootfs.tar.gz
