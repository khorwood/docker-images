FROM ghcr.io/khorwood/alpine@sha256:b8e3e166dcb55b636ab27c8f1443e3c577785c87462602c7b5a7f8cb721b82e8

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN set -x \
    && \
    apk add --no-cache --virtual=run-deps \
        soju \
    && \
    apk upgrade --no-cache \
    && \
    adduser -D -H -s /sbin/nologin app \
    && \
    rm -rf /tmp/* \
           /var/cache/apk/* \
           /var/tmp/*

VOLUME ["/config"]

EXPOSE 6667

USER app

CMD ["soju", "-config", "/config/config"]
