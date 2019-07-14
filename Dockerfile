FROM alpine:3.10
LABEL maintainer="Janne K <0x022b@gmail.com>"

ENTRYPOINT ["docker-entrypoint"]
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
    transmission-daemon && \
deluser transmission

COPY rootfs/ /
