FROM ghcr.io/khorwood/alpine:3.23.3

ARG RELEASE=2.53.4-r4

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apk add --no-cache --virtual=run-deps \
        prometheus=${RELEASE} && \
    apk upgrade --no-cache && \
    adduser -D -H -s /sbin/nologin app && \
    rm -rf \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

EXPOSE 9090

VOLUME ["/config"]

USER app

CMD ["prometheus", "--config.file=/config/prometheus.yml", "--storage.tsdb.path=/data"]
