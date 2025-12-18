FROM ghcr.io/khorwood/alpine:3.23.2

ARG RELEASE=1.4.5-r4

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN apk add --no-cache --virtual=run-deps \
        irssi=${RELEASE} && \
    apk upgrade --no-cache && \
    adduser -D -H app && \
    rm -rf \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

USER app

CMD ["/bin/sh", "-c", "trap : TERM INT; sleep infinity & wait"]
