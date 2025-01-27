FROM ghcr.io/linuxserver/unrar:amd64-latest@sha256:7ef66436e7a5021a81efea9e48b1db7a6e0ae41736accf7b6c4fc851a39cf704 AS unrar

FROM ghcr.io/khorwood/alpine@sha256:544ca6693e28b05b019c030f8e7639aa88520f208cb973b9bc132204cff3e6be

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
    wget -q -O /tmp/sabnzbd.tar.gz "https://github.com/sabnzbd/sabnzbd/releases/download/4.4.1/SABnzbd-4.4.1-src.tar.gz" \
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
