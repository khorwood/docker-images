FROM alpine:3@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN set -x \
    && \
    wget -q -O /tmp/yarr.zip "https://github.com/nkanaev/yarr/releases/download/v2.4/yarr-v2.4-linux64.zip" \
    && \
    mkdir -p /app \
    && \
    unzip -d /app /tmp/yar.zip \
    && \
    adduser -D -H -s /sbin/nologin app \
    && \
    rm -rf \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

EXPOSE 7070

VOLUME ["/data"]

USER app

CMD ["/usr/local/bin/yarr", "-addr", "0.0.0.0:7070", "-db", "/data"]
