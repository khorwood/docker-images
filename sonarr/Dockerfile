FROM ghcr.io/khorwood/alpine@sha256:b8e3e166dcb55b636ab27c8f1443e3c577785c87462602c7b5a7f8cb721b82e8

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN apk add --no-cache --virtual=run-deps \
        icu-libs \
        sqlite-libs \
        xmlstarlet && \
    apk upgrade --no-cache && \
    wget -q -O /tmp/sonarr.tar.gz "https://github.com/Sonarr/Sonarr/releases/download/v4.0.14.2939/Sonarr.main.4.0.14.2939.linux-musl-x64.tar.gz" && \
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
