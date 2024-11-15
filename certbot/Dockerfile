FROM alpine:3@sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

COPY ./requirements.txt /tmp

# hadolint ignore=DL3018
RUN set -x \
    && \
    apk add --no-cache --virtual=run-deps \
        certbot \
        python3 \
        py3-pip \
    && \
    apk upgrade --no-cache \
    && \
    python3 -m pip install --require-hashes --only-binary :all: --no-cache-dir --break-system-packages -r /tmp/requirements.txt \
    && \
    rm -rf /tmp/* \
           /var/cache/apk/* \
           /var/tmp/*

COPY ./certbot.sh /

VOLUME ["/etc/letsencrypt"]

ENTRYPOINT [ "./certbot.sh" ]
