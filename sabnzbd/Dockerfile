FROM ghcr.io/linuxserver/unrar:amd64-latest@sha256:0e9feba8c3a0f3fa824adae9eaf421c607b404cfe46e22243be27fb5e9044fef AS unrar

FROM alpine:3@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d

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
    wget -q -O /tmp/sabnzbd.tar.gz "https://github.com/sabnzbd/sabnzbd/releases/download/4.3.3/SABnzbd-4.3.3-src.tar.gz" \
    && \
    mkdir -p /app \
    && \
    tar xzf /tmp/sabnzbd.tar.gz -C /app --strip-components=1 \
    && \
    python3 -m pip install --no-cache-dir --break-system-packages -r /app/requirements.txt \
    && \
    rm -rf \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

COPY --from=unrar /usr/bin/unrar-alpine /usr/bin/unrar

EXPOSE 8080

VOLUME ["/config"]

CMD ["python3", "/app/SABnzbd.py", "-f", "/config/sabnzbd.ini"]
