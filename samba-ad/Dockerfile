FROM ghcr.io/khorwood/alpine@sha256:b8e3e166dcb55b636ab27c8f1443e3c577785c87462602c7b5a7f8cb721b82e8

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

COPY entrypoint.sh /entrypoint.sh

RUN set -x \
    && \
    apk add --no-cache --virtual=run-deps \
        samba-dc \
    && \
    apk upgrade --no-cache \
    && \
    rm -rf /tmp/* \
           /var/cache/apk/* \
           /var/tmp/*

EXPOSE 22 53 88 135 139 138 389 445 464 3268 3269

VOLUME ["/var/lib/samba"]

CMD ["/entrypoint.sh"]
