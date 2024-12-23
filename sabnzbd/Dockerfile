FROM ghcr.io/linuxserver/unrar:amd64-latest@sha256:d778097b13aa9dd035c0aa73dada05559802c9ba6e7fb080e462bb5e0bea17d9 AS unrar

FROM ghcr.io/khorwood/alpine@sha256:a26b9611bb369145654f0dd9964a194b374c0eeb32672d1517eace43ef7b0651

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
