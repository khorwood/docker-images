FROM ghcr.io/khorwood/alpine@sha256:cc50ca31a798fcfe1b0a9a181195984d49eecb2388345d5180e7280464f05c36

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
