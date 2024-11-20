FROM ghcr.io/khorwood/alpine@sha256:d0e1214587cb8d6795776ea495b01f02522f3956b58c2579d94248e9060fee80

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
