FROM ghcr.io/khorwood/alpine@sha256:544ca6693e28b05b019c030f8e7639aa88520f208cb973b9bc132204cff3e6be

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
    wget -q -O /tmp/radarr.tar.gz "https://github.com/Radarr/Radarr/releases/download/v5.18.4.9674/Radarr.master.5.18.4.9674.linux-musl-core-x64.tar.gz" \
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
