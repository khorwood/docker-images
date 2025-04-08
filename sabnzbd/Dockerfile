FROM ghcr.io/linuxserver/unrar:amd64-latest@sha256:e96edbd79865c1bfbd667cfeb2aee33d0f5cb1eae1d30008dd16b8a75ea6d01b AS unrar

FROM ghcr.io/khorwood/alpine@sha256:b8e3e166dcb55b636ab27c8f1443e3c577785c87462602c7b5a7f8cb721b82e8

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
    wget -q -O /tmp/sabnzbd.tar.gz "https://github.com/sabnzbd/sabnzbd/releases/download/4.5.0/SABnzbd-4.5.0-src.tar.gz" \
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
