FROM alpine:3.11
LABEL maintainer="Janne K <0x022b@gmail.com>"

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/container-entrypoint"]
CMD ["container-daemon"]

RUN \
apk upgrade --no-cache && \
apk add --no-cache \
    ca-certificates \
    iptables \
    ip6tables \
    tini

VOLUME ["/app", "/data"]

RUN \
apk add --no-cache \
    transmission-daemon && \
deluser transmission

EXPOSE 9091/tcp

COPY rootfs/ /
