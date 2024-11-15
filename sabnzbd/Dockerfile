FROM ghcr.io/linuxserver/unrar:amd64-latest@sha256:0e9feba8c3a0f3fa824adae9eaf421c607b404cfe46e22243be27fb5e9044fef AS unrar

FROM alpine:3@sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN set -x \
    && \
    echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && \
    apk add --no-cache --virtual=run-deps \
        7zip \
        par2cmdline-turbo \
        python3 \
        py3-pip \
    && \
    apk upgrade --no-cache \
    && \
    wget -q -O /tmp/sabnzbd.tar.gz "https://github.com/sabnzbd/sabnzbd/releases/download/4.3.3/SABnzbd-4.3.3-src.tar.gz" \
    && \
    mkdir -p /app \
    && \
    tar xzf /tmp/sabnzbd.tar.gz -C /app --strip-components=1 \
    && \
    python3 -m pip install --no-cache-dir --break-system-packages -r /app/requirements.txt \
    && \
    adduser -D -H -s /sbin/nologin app \
    && \
    rm -rf \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

COPY --from=unrar /usr/bin/unrar-alpine /usr/bin/unrar

EXPOSE 8080

VOLUME ["/config"]

USER app

CMD ["python3", "/app/SABnzbd.py", "-f", "/config/sabnzbd.ini"]
