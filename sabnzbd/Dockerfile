FROM ghcr.io/linuxserver/unrar:amd64-latest@sha256:d33fbff49c3a549ca80569767e68b0d1f9ba57bb2d1a9dbef3478f350362520b AS unrar

FROM ghcr.io/khorwood/alpine:3.22.1

ARG RELEASE=4.5.2

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache --virtual=run-deps \
        7zip \
        par2cmdline-turbo \
        python3 \
        py3-pip && \
    apk upgrade --no-cache && \
    wget -q -O /tmp/sabnzbd.tar.gz "https://github.com/sabnzbd/sabnzbd/releases/download/${RELEASE}/SABnzbd-${RELEASE}-src.tar.gz" && \
    mkdir -p /app && \
    tar xzf /tmp/sabnzbd.tar.gz -C /app --strip-components=1 && \
    python3 -m pip install --no-cache-dir --root-user-action=ignore --break-system-packages -r /app/requirements.txt && \
    adduser -D -H -s /sbin/nologin app && \
    rm -rf \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

COPY --from=unrar /usr/bin/unrar-alpine /usr/bin/unrar

EXPOSE 8080

VOLUME ["/config"]

USER app

CMD ["python3", "/app/SABnzbd.py", "-f", "/config/sabnzbd.ini"]
