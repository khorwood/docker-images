FROM ghcr.io/khorwood/alpine@sha256:a1f048361ae7559d31458d97d82099837ba2517497271eef8fac5e229c4f2578

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
