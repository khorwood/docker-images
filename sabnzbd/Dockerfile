FROM ghcr.io/linuxserver/unrar:amd64-latest@sha256:05f8cbca9066d46ea5761cb1eae7bfc4185d4c7d2dedb807bf22f2a2cd16c2d1 AS unrar

FROM ghcr.io/khorwood/alpine@sha256:baa417040acf3004ccc2b2d587f52ec2a698f76af7fda99c97f0a21e60937205

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
    apk add --no-cache gcc && \
    apk upgrade --no-cache && \
    wget -q -O /tmp/sabnzbd.tar.gz "https://github.com/sabnzbd/sabnzbd/releases/download/4.5.1/SABnzbd-4.5.1-src.tar.gz" && \
    mkdir -p /app && \
    tar xzf /tmp/sabnzbd.tar.gz -C /app --strip-components=1 && \
    python3 -m pip install --no-cache-dir --root-user-action=ignore --break-system-packages -r /app/requirements.txt && \
    apk del gcc && \
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
