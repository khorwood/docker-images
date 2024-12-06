FROM ghcr.io/khorwood/alpine@sha256:a26b9611bb369145654f0dd9964a194b374c0eeb32672d1517eace43ef7b0651

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
