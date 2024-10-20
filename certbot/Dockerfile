FROM alpine:3@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d

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
    python3 -m pip install --require-hashes --only-binary :all: --no-cache-dir --break-system-packages -r /tmp/requirements.txt \
    && \
    rm -rf /tmp/* \
           /var/cache/apk/* \
           /var/tmp/*

COPY ./certbot.sh /

VOLUME ["/etc/letsencrypt"]

ENTRYPOINT [ "./certbot.sh" ]
