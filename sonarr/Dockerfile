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
    wget -q -O /tmp/sonarr.tar.gz "https://github.com/Sonarr/Sonarr/releases/download/v4.0.12.2823/Sonarr.main.4.0.12.2823.linux-musl-x64.tar.gz" \
    && \
    mkdir -p /app \
    && \
    tar xzf /tmp/sonarr.tar.gz -C /app --strip-components=1 \
    && \
    adduser -D -H -s /sbin/nologin app \
    && \
    rm -rf \
        /app/Sonarr.Update \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

EXPOSE 8989

VOLUME ["/config"]

USER app

CMD ["/app/Sonarr", "-nobrowser", "-data=/config"]
