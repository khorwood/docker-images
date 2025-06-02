FROM ghcr.io/khorwood/alpine@sha256:baa417040acf3004ccc2b2d587f52ec2a698f76af7fda99c97f0a21e60937205

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apk add --no-cache --virtual=run-deps \
        prometheus && \
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
