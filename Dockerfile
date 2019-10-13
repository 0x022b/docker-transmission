FROM alpine:3.10
LABEL maintainer="Janne K <0x022b@gmail.com>"

ENTRYPOINT ["container-entrypoint"]
CMD ["container-daemon"]
VOLUME ["/app"]

RUN \
apk upgrade --no-cache && \
apk add --no-cache \
    ca-certificates \
    iptables \
    ip6tables

COPY rootfs/ /
