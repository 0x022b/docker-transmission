FROM alpine:3.8
LABEL maintainer="Janne K <0x022b@gmail.com>"

ENTRYPOINT ["docker-entrypoint"]
CMD ["container-daemon"]

ARG VOLUME=/data

RUN \
apk upgrade --no-cache && \
apk add --no-cache \
    ca-certificates \
    iptables \
    ip6tables \
    su-exec && \
mkdir -m 0777 -p "${VOLUME}"

VOLUME ["${VOLUME}"]
WORKDIR "${VOLUME}"

COPY rootfs/ /
