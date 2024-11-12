FROM alpine:3@sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a

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
