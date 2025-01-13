#!/bin/bash -e
RELEASE=alpine-minirootfs-3.21.2-x86_64
curl -sSO https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/$RELEASE.tar.gz
curl -sSO https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/$RELEASE.tar.gz.sha256
sha256sum -c $RELEASE.tar.gz.sha256
