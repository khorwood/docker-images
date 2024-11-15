FROM ghcr.io/khorwood/alpine@sha256:cc50ca31a798fcfe1b0a9a181195984d49eecb2388345d5180e7280464f05c36

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
    wget -q -O /tmp/sonarr.tar.gz "https://services.sonarr.tv/v1/download/main/latest?version=4&os=linuxmusl&arch=x64" \
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
