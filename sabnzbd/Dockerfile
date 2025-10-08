FROM ghcr.io/linuxserver/unrar:amd64-latest@sha256:e38db4a0e6ecad17d57a57d036cf32c136c635fb50d9f28523c83e720d23e65f AS unrar

FROM ghcr.io/khorwood/alpine:3.22.2

ARG RELEASE=4.5.3

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

# hadolint ignore=DL3018
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache --virtual=build-deps \
        build-base \
        python3-dev && \
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
    apk del build-deps && \
    rm -rf \
        /tmp/* \
        /var/cache/apk/* \
        /var/tmp/*

COPY --from=unrar /usr/bin/unrar-alpine /usr/bin/unrar

EXPOSE 8080

VOLUME ["/config"]

USER app

CMD ["python3", "/app/SABnzbd.py", "-f", "/config/sabnzbd.ini"]
