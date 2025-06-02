FROM ghcr.io/khorwood/alpine@sha256:baa417040acf3004ccc2b2d587f52ec2a698f76af7fda99c97f0a21e60937205

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN apk add --no-cache --virtual=run-deps \
        icu-libs \
        sqlite-libs \
        xmlstarlet && \
    apk upgrade --no-cache && \
    wget -q -O /tmp/radarr.tar.gz "https://github.com/Radarr/Radarr/releases/download/v5.25.0.10024/Radarr.master.5.25.0.10024.linux-musl-core-x64.tar.gz" && \
    mkdir -p /app && \
    tar xzf /tmp/radarr.tar.gz -C /app --strip-components=1 && \
    adduser -D -H -s /sbin/nologin app && \
    rm -rf \
        /app/Radarr.Update \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

EXPOSE 7878

VOLUME ["/config"]

USER app

CMD ["/app/Radarr", "-nobrowser", "-data=/config"]
