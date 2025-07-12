FROM ghcr.io/khorwood/alpine:3.22.0

ARG RELEASE=4.0.15.2941

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN apk add --no-cache --virtual=run-deps \
        icu-libs \
        sqlite-libs \
        xmlstarlet && \
    apk upgrade --no-cache && \
    wget -q -O /tmp/sonarr.tar.gz "https://github.com/Sonarr/Sonarr/releases/download/v${RELEASE}/Sonarr.main.${RELEASE}}.linux-musl-x64.tar.gz" && \
    mkdir -p /app && \
    tar xzf /tmp/sonarr.tar.gz -C /app --strip-components=1 && \
    adduser -D -H -s /sbin/nologin app && \
    rm -rf \
        /app/Sonarr.Update \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

EXPOSE 8989

VOLUME ["/config"]

USER app

CMD ["/app/Sonarr", "-nobrowser", "-data=/config"]
