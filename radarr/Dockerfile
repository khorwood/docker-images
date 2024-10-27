FROM alpine:3@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d

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
    wget -q -O /tmp/radarr.tar.gz "https://radarr.servarr.com/v1/update/master/updatefile?os=linuxmusl&runtime=netcore&arch=x64" \
    && \
    mkdir -p /app \
    && \
    tar xzf /tmp/radarr.tar.gz -C /app --strip-components=1 \
    && \
    adduser -D -H -s /sbin/nologin app \
    && \
    rm -rf \
        /app/Radarr.Update \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

EXPOSE 7878

VOLUME ["/config"]

USER app

CMD ["/app/Radarr", "-nobrowser", "-data=/config"]
