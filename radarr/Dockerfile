FROM ghcr.io/khorwood/alpine@sha256:a26b9611bb369145654f0dd9964a194b374c0eeb32672d1517eace43ef7b0651

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
    wget -q -O /tmp/radarr.tar.gz "https://github.com/Radarr/Radarr/releases/download/v5.16.3.9541/Radarr.master.5.16.3.9541.linux-musl-core-x64.tar.gz" \
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
