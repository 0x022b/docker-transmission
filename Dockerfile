FROM alpine:3.11
LABEL maintainer="Janne K <0x022b@gmail.com>"

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/container-entrypoint"]
CMD ["container-daemon"]
VOLUME ["/app", "/data"]

EXPOSE 9091/tcp

RUN \
apk upgrade --no-cache && \
apk add --no-cache \
    ca-certificates \
    iptables \
    ip6tables \
    su-exec \
    tini \
    transmission-daemon && \
deluser transmission

COPY rootfs/ /
