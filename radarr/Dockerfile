FROM ghcr.io/khorwood/alpine@sha256:d0e1214587cb8d6795776ea495b01f02522f3956b58c2579d94248e9060fee80

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN set -x \
    && \
    apk add --no-cache --virtual=run-deps \
        icu-libs \
        sqlite-libs \
        xmlstarlet \
    && \
    apk upgrade --no-cache \
    && \
    wget -q -O /tmp/radarr.tar.gz "https://github.com/Radarr/Radarr/releases/download/v5.15.1.9463/Radarr.master.5.15.1.9463.linux-musl-core-x64.tar.gz" \
    && \
    mkdir -p /app \
    && \
    tar xzf /tmp/radarr.tar.gz -C /app --strip-components=1 \
    && \
    adduser -D -H -s /sbin/nologin app \
    && \
    rm -rf \
        /app/Radarr.Update \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

EXPOSE 7878

VOLUME ["/config"]

USER app

CMD ["/app/Radarr", "-nobrowser", "-data=/config"]
